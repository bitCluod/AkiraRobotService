//#line 2 "/opt/ros/kinetic/share/dynamic_reconfigure/cmake/../templates/ConfigType.h.template"
// *********************************************************
//
// File autogenerated for the gradient_based_navigation package
// by the dynamic_reconfigure package.
// Please do not edit.
//
// ********************************************************/

#ifndef __gradient_based_navigation__GRADIENTBASEDNAVIGATIONCONFIG_H__
#define __gradient_based_navigation__GRADIENTBASEDNAVIGATIONCONFIG_H__

#if __cplusplus >= 201103L
#define DYNAMIC_RECONFIGURE_FINAL final
#else
#define DYNAMIC_RECONFIGURE_FINAL
#endif

#include <dynamic_reconfigure/config_tools.h>
#include <limits>
#include <ros/node_handle.h>
#include <dynamic_reconfigure/ConfigDescription.h>
#include <dynamic_reconfigure/ParamDescription.h>
#include <dynamic_reconfigure/Group.h>
#include <dynamic_reconfigure/config_init_mutex.h>
#include <boost/any.hpp>

namespace gradient_based_navigation
{
  class GradientBasedNavigationConfigStatics;

  class GradientBasedNavigationConfig
  {
  public:
    class AbstractParamDescription : public dynamic_reconfigure::ParamDescription
    {
    public:
      AbstractParamDescription(std::string n, std::string t, uint32_t l,
          std::string d, std::string e)
      {
        name = n;
        type = t;
        level = l;
        description = d;
        edit_method = e;
      }

      virtual void clamp(GradientBasedNavigationConfig &config, const GradientBasedNavigationConfig &max, const GradientBasedNavigationConfig &min) const = 0;
      virtual void calcLevel(uint32_t &level, const GradientBasedNavigationConfig &config1, const GradientBasedNavigationConfig &config2) const = 0;
      virtual void fromServer(const ros::NodeHandle &nh, GradientBasedNavigationConfig &config) const = 0;
      virtual void toServer(const ros::NodeHandle &nh, const GradientBasedNavigationConfig &config) const = 0;
      virtual bool fromMessage(const dynamic_reconfigure::Config &msg, GradientBasedNavigationConfig &config) const = 0;
      virtual void toMessage(dynamic_reconfigure::Config &msg, const GradientBasedNavigationConfig &config) const = 0;
      virtual void getValue(const GradientBasedNavigationConfig &config, boost::any &val) const = 0;
    };

    typedef boost::shared_ptr<AbstractParamDescription> AbstractParamDescriptionPtr;
    typedef boost::shared_ptr<const AbstractParamDescription> AbstractParamDescriptionConstPtr;

    // Final keyword added to class because it has virtual methods and inherits
    // from a class with a non-virtual destructor.
    template <class T>
    class ParamDescription DYNAMIC_RECONFIGURE_FINAL : public AbstractParamDescription
    {
    public:
      ParamDescription(std::string a_name, std::string a_type, uint32_t a_level,
          std::string a_description, std::string a_edit_method, T GradientBasedNavigationConfig::* a_f) :
        AbstractParamDescription(a_name, a_type, a_level, a_description, a_edit_method),
        field(a_f)
      {}

      T (GradientBasedNavigationConfig::* field);

      virtual void clamp(GradientBasedNavigationConfig &config, const GradientBasedNavigationConfig &max, const GradientBasedNavigationConfig &min) const
      {
        if (config.*field > max.*field)
          config.*field = max.*field;

        if (config.*field < min.*field)
          config.*field = min.*field;
      }

      virtual void calcLevel(uint32_t &comb_level, const GradientBasedNavigationConfig &config1, const GradientBasedNavigationConfig &config2) const
      {
        if (config1.*field != config2.*field)
          comb_level |= level;
      }

      virtual void fromServer(const ros::NodeHandle &nh, GradientBasedNavigationConfig &config) const
      {
        nh.getParam(name, config.*field);
      }

      virtual void toServer(const ros::NodeHandle &nh, const GradientBasedNavigationConfig &config) const
      {
        nh.setParam(name, config.*field);
      }

      virtual bool fromMessage(const dynamic_reconfigure::Config &msg, GradientBasedNavigationConfig &config) const
      {
        return dynamic_reconfigure::ConfigTools::getParameter(msg, name, config.*field);
      }

      virtual void toMessage(dynamic_reconfigure::Config &msg, const GradientBasedNavigationConfig &config) const
      {
        dynamic_reconfigure::ConfigTools::appendParameter(msg, name, config.*field);
      }

      virtual void getValue(const GradientBasedNavigationConfig &config, boost::any &val) const
      {
        val = config.*field;
      }
    };

    class AbstractGroupDescription : public dynamic_reconfigure::Group
    {
      public:
      AbstractGroupDescription(std::string n, std::string t, int p, int i, bool s)
      {
        name = n;
        type = t;
        parent = p;
        state = s;
        id = i;
      }

      std::vector<AbstractParamDescriptionConstPtr> abstract_parameters;
      bool state;

      virtual void toMessage(dynamic_reconfigure::Config &msg, const boost::any &config) const = 0;
      virtual bool fromMessage(const dynamic_reconfigure::Config &msg, boost::any &config) const =0;
      virtual void updateParams(boost::any &cfg, GradientBasedNavigationConfig &top) const= 0;
      virtual void setInitialState(boost::any &cfg) const = 0;


      void convertParams()
      {
        for(std::vector<AbstractParamDescriptionConstPtr>::const_iterator i = abstract_parameters.begin(); i != abstract_parameters.end(); ++i)
        {
          parameters.push_back(dynamic_reconfigure::ParamDescription(**i));
        }
      }
    };

    typedef boost::shared_ptr<AbstractGroupDescription> AbstractGroupDescriptionPtr;
    typedef boost::shared_ptr<const AbstractGroupDescription> AbstractGroupDescriptionConstPtr;

    // Final keyword added to class because it has virtual methods and inherits
    // from a class with a non-virtual destructor.
    template<class T, class PT>
    class GroupDescription DYNAMIC_RECONFIGURE_FINAL : public AbstractGroupDescription
    {
    public:
      GroupDescription(std::string a_name, std::string a_type, int a_parent, int a_id, bool a_s, T PT::* a_f) : AbstractGroupDescription(a_name, a_type, a_parent, a_id, a_s), field(a_f)
      {
      }

      GroupDescription(const GroupDescription<T, PT>& g): AbstractGroupDescription(g.name, g.type, g.parent, g.id, g.state), field(g.field), groups(g.groups)
      {
        parameters = g.parameters;
        abstract_parameters = g.abstract_parameters;
      }

      virtual bool fromMessage(const dynamic_reconfigure::Config &msg, boost::any &cfg) const
      {
        PT* config = boost::any_cast<PT*>(cfg);
        if(!dynamic_reconfigure::ConfigTools::getGroupState(msg, name, (*config).*field))
          return false;

        for(std::vector<AbstractGroupDescriptionConstPtr>::const_iterator i = groups.begin(); i != groups.end(); ++i)
        {
          boost::any n = &((*config).*field);
          if(!(*i)->fromMessage(msg, n))
            return false;
        }

        return true;
      }

      virtual void setInitialState(boost::any &cfg) const
      {
        PT* config = boost::any_cast<PT*>(cfg);
        T* group = &((*config).*field);
        group->state = state;

        for(std::vector<AbstractGroupDescriptionConstPtr>::const_iterator i = groups.begin(); i != groups.end(); ++i)
        {
          boost::any n = boost::any(&((*config).*field));
          (*i)->setInitialState(n);
        }

      }

      virtual void updateParams(boost::any &cfg, GradientBasedNavigationConfig &top) const
      {
        PT* config = boost::any_cast<PT*>(cfg);

        T* f = &((*config).*field);
        f->setParams(top, abstract_parameters);

        for(std::vector<AbstractGroupDescriptionConstPtr>::const_iterator i = groups.begin(); i != groups.end(); ++i)
        {
          boost::any n = &((*config).*field);
          (*i)->updateParams(n, top);
        }
      }

      virtual void toMessage(dynamic_reconfigure::Config &msg, const boost::any &cfg) const
      {
        const PT config = boost::any_cast<PT>(cfg);
        dynamic_reconfigure::ConfigTools::appendGroup<T>(msg, name, id, parent, config.*field);

        for(std::vector<AbstractGroupDescriptionConstPtr>::const_iterator i = groups.begin(); i != groups.end(); ++i)
        {
          (*i)->toMessage(msg, config.*field);
        }
      }

      T (PT::* field);
      std::vector<GradientBasedNavigationConfig::AbstractGroupDescriptionConstPtr> groups;
    };

class DEFAULT
{
  public:
    DEFAULT()
    {
      state = true;
      name = "Default";
    }

    void setParams(GradientBasedNavigationConfig &config, const std::vector<AbstractParamDescriptionConstPtr> params)
    {
      for (std::vector<AbstractParamDescriptionConstPtr>::const_iterator _i = params.begin(); _i != params.end(); ++_i)
      {
        boost::any val;
        (*_i)->getValue(config, val);

        if("max_vel_x"==(*_i)->name){max_vel_x = boost::any_cast<double>(val);}
        if("max_vel_theta"==(*_i)->name){max_vel_theta = boost::any_cast<double>(val);}
        if("attractiveDistanceInfluence_m"==(*_i)->name){attractiveDistanceInfluence_m = boost::any_cast<double>(val);}
        if("obstaclesDistanceInfluence_m"==(*_i)->name){obstaclesDistanceInfluence_m = boost::any_cast<double>(val);}
        if("force_scale"==(*_i)->name){force_scale = boost::any_cast<double>(val);}
        if("momentum_scale"==(*_i)->name){momentum_scale = boost::any_cast<double>(val);}
        if("robot_radius"==(*_i)->name){robot_radius = boost::any_cast<double>(val);}
      }
    }

    double max_vel_x;
double max_vel_theta;
double attractiveDistanceInfluence_m;
double obstaclesDistanceInfluence_m;
double force_scale;
double momentum_scale;
double robot_radius;

    bool state;
    std::string name;

    
}groups;



//#line 290 "/opt/ros/kinetic/lib/python2.7/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      double max_vel_x;
//#line 290 "/opt/ros/kinetic/lib/python2.7/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      double max_vel_theta;
//#line 290 "/opt/ros/kinetic/lib/python2.7/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      double attractiveDistanceInfluence_m;
//#line 290 "/opt/ros/kinetic/lib/python2.7/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      double obstaclesDistanceInfluence_m;
//#line 290 "/opt/ros/kinetic/lib/python2.7/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      double force_scale;
//#line 290 "/opt/ros/kinetic/lib/python2.7/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      double momentum_scale;
//#line 290 "/opt/ros/kinetic/lib/python2.7/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      double robot_radius;
//#line 228 "/opt/ros/kinetic/share/dynamic_reconfigure/cmake/../templates/ConfigType.h.template"

    bool __fromMessage__(dynamic_reconfigure::Config &msg)
    {
      const std::vector<AbstractParamDescriptionConstPtr> &__param_descriptions__ = __getParamDescriptions__();
      const std::vector<AbstractGroupDescriptionConstPtr> &__group_descriptions__ = __getGroupDescriptions__();

      int count = 0;
      for (std::vector<AbstractParamDescriptionConstPtr>::const_iterator i = __param_descriptions__.begin(); i != __param_descriptions__.end(); ++i)
        if ((*i)->fromMessage(msg, *this))
          count++;

      for (std::vector<AbstractGroupDescriptionConstPtr>::const_iterator i = __group_descriptions__.begin(); i != __group_descriptions__.end(); i ++)
      {
        if ((*i)->id == 0)
        {
          boost::any n = boost::any(this);
          (*i)->updateParams(n, *this);
          (*i)->fromMessage(msg, n);
        }
      }

      if (count != dynamic_reconfigure::ConfigTools::size(msg))
      {
        ROS_ERROR("GradientBasedNavigationConfig::__fromMessage__ called with an unexpected parameter.");
        ROS_ERROR("Booleans:");
        for (unsigned int i = 0; i < msg.bools.size(); i++)
          ROS_ERROR("  %s", msg.bools[i].name.c_str());
        ROS_ERROR("Integers:");
        for (unsigned int i = 0; i < msg.ints.size(); i++)
          ROS_ERROR("  %s", msg.ints[i].name.c_str());
        ROS_ERROR("Doubles:");
        for (unsigned int i = 0; i < msg.doubles.size(); i++)
          ROS_ERROR("  %s", msg.doubles[i].name.c_str());
        ROS_ERROR("Strings:");
        for (unsigned int i = 0; i < msg.strs.size(); i++)
          ROS_ERROR("  %s", msg.strs[i].name.c_str());
        // @todo Check that there are no duplicates. Make this error more
        // explicit.
        return false;
      }
      return true;
    }

    // This version of __toMessage__ is used during initialization of
    // statics when __getParamDescriptions__ can't be called yet.
    void __toMessage__(dynamic_reconfigure::Config &msg, const std::vector<AbstractParamDescriptionConstPtr> &__param_descriptions__, const std::vector<AbstractGroupDescriptionConstPtr> &__group_descriptions__) const
    {
      dynamic_reconfigure::ConfigTools::clear(msg);
      for (std::vector<AbstractParamDescriptionConstPtr>::const_iterator i = __param_descriptions__.begin(); i != __param_descriptions__.end(); ++i)
        (*i)->toMessage(msg, *this);

      for (std::vector<AbstractGroupDescriptionConstPtr>::const_iterator i = __group_descriptions__.begin(); i != __group_descriptions__.end(); ++i)
      {
        if((*i)->id == 0)
        {
          (*i)->toMessage(msg, *this);
        }
      }
    }

    void __toMessage__(dynamic_reconfigure::Config &msg) const
    {
      const std::vector<AbstractParamDescriptionConstPtr> &__param_descriptions__ = __getParamDescriptions__();
      const std::vector<AbstractGroupDescriptionConstPtr> &__group_descriptions__ = __getGroupDescriptions__();
      __toMessage__(msg, __param_descriptions__, __group_descriptions__);
    }

    void __toServer__(const ros::NodeHandle &nh) const
    {
      const std::vector<AbstractParamDescriptionConstPtr> &__param_descriptions__ = __getParamDescriptions__();
      for (std::vector<AbstractParamDescriptionConstPtr>::const_iterator i = __param_descriptions__.begin(); i != __param_descriptions__.end(); ++i)
        (*i)->toServer(nh, *this);
    }

    void __fromServer__(const ros::NodeHandle &nh)
    {
      static bool setup=false;

      const std::vector<AbstractParamDescriptionConstPtr> &__param_descriptions__ = __getParamDescriptions__();
      for (std::vector<AbstractParamDescriptionConstPtr>::const_iterator i = __param_descriptions__.begin(); i != __param_descriptions__.end(); ++i)
        (*i)->fromServer(nh, *this);

      const std::vector<AbstractGroupDescriptionConstPtr> &__group_descriptions__ = __getGroupDescriptions__();
      for (std::vector<AbstractGroupDescriptionConstPtr>::const_iterator i = __group_descriptions__.begin(); i != __group_descriptions__.end(); i++){
        if (!setup && (*i)->id == 0) {
          setup = true;
          boost::any n = boost::any(this);
          (*i)->setInitialState(n);
        }
      }
    }

    void __clamp__()
    {
      const std::vector<AbstractParamDescriptionConstPtr> &__param_descriptions__ = __getParamDescriptions__();
      const GradientBasedNavigationConfig &__max__ = __getMax__();
      const GradientBasedNavigationConfig &__min__ = __getMin__();
      for (std::vector<AbstractParamDescriptionConstPtr>::const_iterator i = __param_descriptions__.begin(); i != __param_descriptions__.end(); ++i)
        (*i)->clamp(*this, __max__, __min__);
    }

    uint32_t __level__(const GradientBasedNavigationConfig &config) const
    {
      const std::vector<AbstractParamDescriptionConstPtr> &__param_descriptions__ = __getParamDescriptions__();
      uint32_t level = 0;
      for (std::vector<AbstractParamDescriptionConstPtr>::const_iterator i = __param_descriptions__.begin(); i != __param_descriptions__.end(); ++i)
        (*i)->calcLevel(level, config, *this);
      return level;
    }

    static const dynamic_reconfigure::ConfigDescription &__getDescriptionMessage__();
    static const GradientBasedNavigationConfig &__getDefault__();
    static const GradientBasedNavigationConfig &__getMax__();
    static const GradientBasedNavigationConfig &__getMin__();
    static const std::vector<AbstractParamDescriptionConstPtr> &__getParamDescriptions__();
    static const std::vector<AbstractGroupDescriptionConstPtr> &__getGroupDescriptions__();

  private:
    static const GradientBasedNavigationConfigStatics *__get_statics__();
  };

  template <> // Max and min are ignored for strings.
  inline void GradientBasedNavigationConfig::ParamDescription<std::string>::clamp(GradientBasedNavigationConfig &config, const GradientBasedNavigationConfig &max, const GradientBasedNavigationConfig &min) const
  {
    (void) config;
    (void) min;
    (void) max;
    return;
  }

  class GradientBasedNavigationConfigStatics
  {
    friend class GradientBasedNavigationConfig;

    GradientBasedNavigationConfigStatics()
    {
GradientBasedNavigationConfig::GroupDescription<GradientBasedNavigationConfig::DEFAULT, GradientBasedNavigationConfig> Default("Default", "", 0, 0, true, &GradientBasedNavigationConfig::groups);
//#line 290 "/opt/ros/kinetic/lib/python2.7/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __min__.max_vel_x = -std::numeric_limits<double>::infinity();
//#line 290 "/opt/ros/kinetic/lib/python2.7/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __max__.max_vel_x = std::numeric_limits<double>::infinity();
//#line 290 "/opt/ros/kinetic/lib/python2.7/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __default__.max_vel_x = 0.75;
//#line 290 "/opt/ros/kinetic/lib/python2.7/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      Default.abstract_parameters.push_back(GradientBasedNavigationConfig::AbstractParamDescriptionConstPtr(new GradientBasedNavigationConfig::ParamDescription<double>("max_vel_x", "double", 0, "Maximum translational velocity", "", &GradientBasedNavigationConfig::max_vel_x)));
//#line 290 "/opt/ros/kinetic/lib/python2.7/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __param_descriptions__.push_back(GradientBasedNavigationConfig::AbstractParamDescriptionConstPtr(new GradientBasedNavigationConfig::ParamDescription<double>("max_vel_x", "double", 0, "Maximum translational velocity", "", &GradientBasedNavigationConfig::max_vel_x)));
//#line 290 "/opt/ros/kinetic/lib/python2.7/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __min__.max_vel_theta = -std::numeric_limits<double>::infinity();
//#line 290 "/opt/ros/kinetic/lib/python2.7/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __max__.max_vel_theta = std::numeric_limits<double>::infinity();
//#line 290 "/opt/ros/kinetic/lib/python2.7/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __default__.max_vel_theta = 0.5;
//#line 290 "/opt/ros/kinetic/lib/python2.7/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      Default.abstract_parameters.push_back(GradientBasedNavigationConfig::AbstractParamDescriptionConstPtr(new GradientBasedNavigationConfig::ParamDescription<double>("max_vel_theta", "double", 0, "Maximum rotational velocity", "", &GradientBasedNavigationConfig::max_vel_theta)));
//#line 290 "/opt/ros/kinetic/lib/python2.7/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __param_descriptions__.push_back(GradientBasedNavigationConfig::AbstractParamDescriptionConstPtr(new GradientBasedNavigationConfig::ParamDescription<double>("max_vel_theta", "double", 0, "Maximum rotational velocity", "", &GradientBasedNavigationConfig::max_vel_theta)));
//#line 290 "/opt/ros/kinetic/lib/python2.7/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __min__.attractiveDistanceInfluence_m = -std::numeric_limits<double>::infinity();
//#line 290 "/opt/ros/kinetic/lib/python2.7/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __max__.attractiveDistanceInfluence_m = std::numeric_limits<double>::infinity();
//#line 290 "/opt/ros/kinetic/lib/python2.7/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __default__.attractiveDistanceInfluence_m = 1.0;
//#line 290 "/opt/ros/kinetic/lib/python2.7/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      Default.abstract_parameters.push_back(GradientBasedNavigationConfig::AbstractParamDescriptionConstPtr(new GradientBasedNavigationConfig::ParamDescription<double>("attractiveDistanceInfluence_m", "double", 0, "Attractive distance influence (m)", "", &GradientBasedNavigationConfig::attractiveDistanceInfluence_m)));
//#line 290 "/opt/ros/kinetic/lib/python2.7/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __param_descriptions__.push_back(GradientBasedNavigationConfig::AbstractParamDescriptionConstPtr(new GradientBasedNavigationConfig::ParamDescription<double>("attractiveDistanceInfluence_m", "double", 0, "Attractive distance influence (m)", "", &GradientBasedNavigationConfig::attractiveDistanceInfluence_m)));
//#line 290 "/opt/ros/kinetic/lib/python2.7/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __min__.obstaclesDistanceInfluence_m = -std::numeric_limits<double>::infinity();
//#line 290 "/opt/ros/kinetic/lib/python2.7/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __max__.obstaclesDistanceInfluence_m = std::numeric_limits<double>::infinity();
//#line 290 "/opt/ros/kinetic/lib/python2.7/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __default__.obstaclesDistanceInfluence_m = 1.0;
//#line 290 "/opt/ros/kinetic/lib/python2.7/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      Default.abstract_parameters.push_back(GradientBasedNavigationConfig::AbstractParamDescriptionConstPtr(new GradientBasedNavigationConfig::ParamDescription<double>("obstaclesDistanceInfluence_m", "double", 0, "Obstacle distance influence (m)", "", &GradientBasedNavigationConfig::obstaclesDistanceInfluence_m)));
//#line 290 "/opt/ros/kinetic/lib/python2.7/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __param_descriptions__.push_back(GradientBasedNavigationConfig::AbstractParamDescriptionConstPtr(new GradientBasedNavigationConfig::ParamDescription<double>("obstaclesDistanceInfluence_m", "double", 0, "Obstacle distance influence (m)", "", &GradientBasedNavigationConfig::obstaclesDistanceInfluence_m)));
//#line 290 "/opt/ros/kinetic/lib/python2.7/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __min__.force_scale = -std::numeric_limits<double>::infinity();
//#line 290 "/opt/ros/kinetic/lib/python2.7/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __max__.force_scale = std::numeric_limits<double>::infinity();
//#line 290 "/opt/ros/kinetic/lib/python2.7/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __default__.force_scale = 0.5;
//#line 290 "/opt/ros/kinetic/lib/python2.7/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      Default.abstract_parameters.push_back(GradientBasedNavigationConfig::AbstractParamDescriptionConstPtr(new GradientBasedNavigationConfig::ParamDescription<double>("force_scale", "double", 0, "Force scale (m)", "", &GradientBasedNavigationConfig::force_scale)));
//#line 290 "/opt/ros/kinetic/lib/python2.7/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __param_descriptions__.push_back(GradientBasedNavigationConfig::AbstractParamDescriptionConstPtr(new GradientBasedNavigationConfig::ParamDescription<double>("force_scale", "double", 0, "Force scale (m)", "", &GradientBasedNavigationConfig::force_scale)));
//#line 290 "/opt/ros/kinetic/lib/python2.7/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __min__.momentum_scale = -std::numeric_limits<double>::infinity();
//#line 290 "/opt/ros/kinetic/lib/python2.7/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __max__.momentum_scale = std::numeric_limits<double>::infinity();
//#line 290 "/opt/ros/kinetic/lib/python2.7/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __default__.momentum_scale = 0.15;
//#line 290 "/opt/ros/kinetic/lib/python2.7/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      Default.abstract_parameters.push_back(GradientBasedNavigationConfig::AbstractParamDescriptionConstPtr(new GradientBasedNavigationConfig::ParamDescription<double>("momentum_scale", "double", 0, "Momentum scale (m)", "", &GradientBasedNavigationConfig::momentum_scale)));
//#line 290 "/opt/ros/kinetic/lib/python2.7/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __param_descriptions__.push_back(GradientBasedNavigationConfig::AbstractParamDescriptionConstPtr(new GradientBasedNavigationConfig::ParamDescription<double>("momentum_scale", "double", 0, "Momentum scale (m)", "", &GradientBasedNavigationConfig::momentum_scale)));
//#line 290 "/opt/ros/kinetic/lib/python2.7/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __min__.robot_radius = -std::numeric_limits<double>::infinity();
//#line 290 "/opt/ros/kinetic/lib/python2.7/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __max__.robot_radius = std::numeric_limits<double>::infinity();
//#line 290 "/opt/ros/kinetic/lib/python2.7/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __default__.robot_radius = 0.2;
//#line 290 "/opt/ros/kinetic/lib/python2.7/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      Default.abstract_parameters.push_back(GradientBasedNavigationConfig::AbstractParamDescriptionConstPtr(new GradientBasedNavigationConfig::ParamDescription<double>("robot_radius", "double", 0, "Robot radius (m)", "", &GradientBasedNavigationConfig::robot_radius)));
//#line 290 "/opt/ros/kinetic/lib/python2.7/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __param_descriptions__.push_back(GradientBasedNavigationConfig::AbstractParamDescriptionConstPtr(new GradientBasedNavigationConfig::ParamDescription<double>("robot_radius", "double", 0, "Robot radius (m)", "", &GradientBasedNavigationConfig::robot_radius)));
//#line 245 "/opt/ros/kinetic/lib/python2.7/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      Default.convertParams();
//#line 245 "/opt/ros/kinetic/lib/python2.7/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __group_descriptions__.push_back(GradientBasedNavigationConfig::AbstractGroupDescriptionConstPtr(new GradientBasedNavigationConfig::GroupDescription<GradientBasedNavigationConfig::DEFAULT, GradientBasedNavigationConfig>(Default)));
//#line 366 "/opt/ros/kinetic/share/dynamic_reconfigure/cmake/../templates/ConfigType.h.template"

      for (std::vector<GradientBasedNavigationConfig::AbstractGroupDescriptionConstPtr>::const_iterator i = __group_descriptions__.begin(); i != __group_descriptions__.end(); ++i)
      {
        __description_message__.groups.push_back(**i);
      }
      __max__.__toMessage__(__description_message__.max, __param_descriptions__, __group_descriptions__);
      __min__.__toMessage__(__description_message__.min, __param_descriptions__, __group_descriptions__);
      __default__.__toMessage__(__description_message__.dflt, __param_descriptions__, __group_descriptions__);
    }
    std::vector<GradientBasedNavigationConfig::AbstractParamDescriptionConstPtr> __param_descriptions__;
    std::vector<GradientBasedNavigationConfig::AbstractGroupDescriptionConstPtr> __group_descriptions__;
    GradientBasedNavigationConfig __max__;
    GradientBasedNavigationConfig __min__;
    GradientBasedNavigationConfig __default__;
    dynamic_reconfigure::ConfigDescription __description_message__;

    static const GradientBasedNavigationConfigStatics *get_instance()
    {
      // Split this off in a separate function because I know that
      // instance will get initialized the first time get_instance is
      // called, and I am guaranteeing that get_instance gets called at
      // most once.
      static GradientBasedNavigationConfigStatics instance;
      return &instance;
    }
  };

  inline const dynamic_reconfigure::ConfigDescription &GradientBasedNavigationConfig::__getDescriptionMessage__()
  {
    return __get_statics__()->__description_message__;
  }

  inline const GradientBasedNavigationConfig &GradientBasedNavigationConfig::__getDefault__()
  {
    return __get_statics__()->__default__;
  }

  inline const GradientBasedNavigationConfig &GradientBasedNavigationConfig::__getMax__()
  {
    return __get_statics__()->__max__;
  }

  inline const GradientBasedNavigationConfig &GradientBasedNavigationConfig::__getMin__()
  {
    return __get_statics__()->__min__;
  }

  inline const std::vector<GradientBasedNavigationConfig::AbstractParamDescriptionConstPtr> &GradientBasedNavigationConfig::__getParamDescriptions__()
  {
    return __get_statics__()->__param_descriptions__;
  }

  inline const std::vector<GradientBasedNavigationConfig::AbstractGroupDescriptionConstPtr> &GradientBasedNavigationConfig::__getGroupDescriptions__()
  {
    return __get_statics__()->__group_descriptions__;
  }

  inline const GradientBasedNavigationConfigStatics *GradientBasedNavigationConfig::__get_statics__()
  {
    const static GradientBasedNavigationConfigStatics *statics;

    if (statics) // Common case
      return statics;

    boost::mutex::scoped_lock lock(dynamic_reconfigure::__init_mutex__);

    if (statics) // In case we lost a race.
      return statics;

    statics = GradientBasedNavigationConfigStatics::get_instance();

    return statics;
  }


}

#undef DYNAMIC_RECONFIGURE_FINAL

#endif // __GRADIENTBASEDNAVIGATIONRECONFIGURATOR_H__