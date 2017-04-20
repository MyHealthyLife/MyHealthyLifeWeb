# MyHealthyLifeWeb Application (client)

This is the web application for MyHealthyLife project and it is hosted in heroku domains. It has the duty to retrieve, view, create and update all the information related to the user and the community. 

The main page of the web application is at the following address: https://myhealthylifeweb.herokuapp.com/login.jsp


## 1. User interface

#####Pages

The login page is the first thing that will be presented to a client that hasn't got a session object. As soon as the client logs in the system it will display the main page.
In particular, the application is composed of three different page:
- **index.html:** This is the main page and is built with all the personal information related to a user. To be precise, the page comes with the personal information related to the user, weather information, suggested foods section and suggested recipes section and the sentences dedicated by other users of the community. 
- **progress.html:** The page is built in order to group together all the information related to the measures of a user. To be precise, at the top of the page some progress bars will keep track of the most recent measures submitted by the user. Furthermore, the page has some sections able to submit a new measure, to view the current measures and view the whole measure history of the user.
- **social.html:** The page is built so to group all the information related to the 'social' part of the system. A ranking table will be constructed and viewed at the top, as long as some data of the closest users. Furthermore, the page will give the possibility to create foods and add new recipes, create new sentences and dedicate them to other users from the community.

An extra page (help.html) was built in order to let the user submit a question or give feedback to the administrators of the system.

#####Bootstrap components

Since the main objective of the application was to be adaptable to different kind of devices, bootstrap components were used in order to construct pages with responsive layouts.
In particular, those pages are also integrated inside the android application that comes with the clients pack.

## 2. Application implementation
#####Packages

The HTML pages and the related JS, CSS files are all contained in the **main.webapp** folder.

The rest of the application is structured as follows:
- **myhealthylife.dataservice.model:** This package contains all the necessary classes from service 1 that need to be processed before being represented. These are necessary in order to be able to update information related to a user
- **myhealthylife.dataservice.model.util:** Contains a class with some methods able to perform operations on Date objects, in order to be able to get a readable representation of them
- **myhealthylife.myhealthylifeweb:** Contains all servlets and classes that handle the URLs of the main services (centric01 and centric02)

#####Servlets

The servlets inside the application are the following:
- **LoginValidator:** This servlet has the duty to call centric01 in order to check the login credentials and retrieve all the data of a user. The related data will be visualized in the main page.
- **Logout:** This servlet has the duty to invalidate the session object for a specific user. When the user presses logout button in the application, he/she will be redirected to the login page.
- **Registration:** It has the duty to make a request to centric01 in order to create a new user. The result of the operation will be displayed in a message modal in the login page.

#####Angularjs modules

In order to be able to perform requests to centric01 and centric02 services, Angularjs components have been used.
All the three pages described above in fact have several controllers, each one controlling a different section of the page.
Angularjs features were used in particular to easily divide the implementations of the sections in the same JS files, in order to make everything clear and easy to reuse when updating the code.
This solution has also one great advantage related to the portability of the code: the android application in fact uses Android Webview system in order to load and interact with the pages.
This will be explained in detail in the Android application related to this project.

