import threading
import time
import socket
import sys
import os
import json

class ASRServer(threading.Thread):

    def __init__(self, port):
        threading.Thread.__init__(self)

        # Create a TCP/IP socket
        self.sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        self.sock.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
        self.sock.settimeout(3) # timeout when listening (exit with CTRL+C)
        # Bind the socket to the port
        server_address = ('', port)
        self.sock.bind(server_address)
        self.sock.listen(1)
        print "ASR Server running on port ", port, " ..."
        
        self.dorun = True
        self.connection = None
        self.received = ''  # transcriptions received from ASR
        self.best_hypo = '' # best hypothesis from transcriptions
        self.rcv_time = 0

    def stop(self):
        self.dorun = False

    def connect(self):
        connected = False
        while (self.dorun and not connected):
            try:
                # print 'Waiting for a connection ...'
                # Wait for a connection
                self.connection, client_address = self.sock.accept()
                self.connection.settimeout(3)
                connected = True
                print 'ASR Server Connection from ', client_address
            except:
                pass #print "Listen again ..."    


    def run(self):
        while (self.dorun):
            self.connect()
            try:
                # Receive the data in small chunks and retransmit it
                while (self.dorun):
                    try:
                        data = self.connection.recv(2048)
                        data = data.strip()
                    except socket.timeout:
                        data = "***"
                    except:
                        data = None
                    
                    if (data!=None and data !="" and data!="***" and data[0]!='$' and data!='KEEP_AWAKE'):
                        if data!='REQ':
                            print 'ASR Received %s' % data
                        self.received = data
                        if (data[0]=='{'): # json string                        
                            transcriptions = json.loads(data)
                            self.best_hypo = transcriptions['hypotheses'][0]['transcription']
                            self.rcv_time = time.time()
                        elif data=='REQ':
                            self.connection.send('ACK\n\r')

                    elif (data == None or data==""):
                        break
            finally:
                print 'ASR Server Connection closed.'
                # Clean up the connection
                if (self.connection != None):
                    self.connection.close()
                    self.connection = None


    def get_asr(self):
        dt = time.time() - self.rcv_time
        #print "dtime ",dt
        if (dt < 5): # only if in the last 5 seconds
            r = self.best_hypo  # send only once
            self.best_hypo = ''
            self.rcv_time = 0
            return r
        else:
            return ''


if __name__ == "__main__":
    port = 9002
    if (len(sys.argv)>1):
        port = int(sys.argv[1]);

    server = ASRServer(port)
    server.start()

    run = True
    while run:
        try:        
            time.sleep(1)
        except:
            run = False

    print "Exit"
    server.stop()
    sys.exit(0)





