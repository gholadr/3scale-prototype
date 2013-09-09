pushed a 3scale test on heroku (based on this https://github.com/3scale/sentiment-api-example/)


http://threescale-test.herokuapp.com/v1.1/words/hello.json?app_id=0b035469&app_key=309e28f7f06a85d0af4718220c7f41ee
http://threescale-test.herokuapp.com/v1.1/sentences/this+is+a+sentence.json?app_id=0b035469&app_key=309e28f7f06a85d0af4718220c7f41ee


its using grape/rack/thin and a 3scale ruby gem 


try calling the api directly without passing the app_id/app_key or messing around with the values… you should get a 403