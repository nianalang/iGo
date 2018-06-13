particlesJS('box',
  
  {
    "particles": {          /*粒子数量及密度*/
      "number": {
        "value": 35,
        "density": {             /*启用粒子的稀密程度 （true 或 false）*/
          "enable": true,
          "value_area": 840             /*每一个粒子占据的空间（启用粒子密度，才可用）*/
        }
      },
      "color": {             /*设置粒子颜色*/
        "value": "#bdc3c7"
      },
      
      "shape": {              /*设置粒子形状*/
        "type": "circle",
        
   
      },
      "opacity": {        /*粒子的透明度*/
        "value": 0.8,
        "random": false,
        "animnate": {
          "enable": false,
          "speed": 2,
          "opacity_min": 0.1,
          "sync": false
        }
      },
      "size": {                    
        "value": 15,
        "random": true,
        "anim": {                      /*是否启用粒子速度（true/false）*/
          "enable": false,
          "speed": 5,              /*粒子动画频率*/
          "size_min": 0.1,
          "sync": false                   /*粒子运行速度与动画是否同步*/
        }
      },
      "line_linked": {   /*连线*/
        "enable": true,
        "distance": 150,
        "color": "#ddd",
        "opacity": 0.7,
        "width": 1.5
      },
      "move": {                        
        "enable": true,
        "speed": 2,                           /*粒子的移动速度*/
        "direction": "none",
        "random": false,
        "straight": false,
        "out_mode": "out",
        "attract": {
          "enable": false,
          "rotateX": 600,
          "rotateY": 1200
        }
      }
    },
    "interactivity": {
      "detect_on": "canvas",
      "events": {
        "onhover": {
          "enable": false,
          "mode": "repulse"
        },
        "onclick": {                /*鼠标点击*/
          "enable": true,
          "mode": "push"
        },
        "resize": true
      },
      "modes": {
        "grab": {
          "distance": 400,
          "line_linked": {
            "opacity": 1
          }
        },
        "bubble": {
          "distance": 400,
          "size": 40,
          "duration": 2,
          "opacity": 8,
          "speed": 3
        },
        "repulse": {
          "distance": 200
        },
        "push": {
          "particles_nb": 4
        },
        "remove": {
          "particles_nb": 2
        }
      }
    },
    "retina_detect": true,
    "config_demo": {
      "hide_card": false,
      "background_color": "#b61924",
      "background_image": "",
      "background_position": "50% 50%",
      "background_repeat": "no-repeat",
      "background_size": "cover"
    }
  }

);