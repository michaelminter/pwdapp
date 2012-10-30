#Password reGeneration and Synchronization Daemon

Provides auto-renewing security credentials for your favorite websites.

##Description
P, as it will be known, is a Ruby on Rails application that cyclically generates a new password, per user, per pre-selected amount of time (divied by day, week, month, month(n), etc). This new password will be the placeholder for new passwords on synced and concurrent SAAS applications that have been opted into the known remote access points.

Every day millions of online accounts are compromised by insecure computer use, crackers, and irresponsible IT workers. P, is a safety insurance to increase your mobile defenses by providing an extra layer of control to your password management. Set up each of your accounts, from a varied array of websites, just once and P will help prevent all malicious behaviors conclusive to digital impersonation.

##Name Prospects (in order of favor)
* pwdapp.com
* pwdstat.us
* pwdaemon.com
* secfoc.us

##Secondary Development Tasks

###Legal documentation
Search [LegalZoom](http://legalzoom.com) or [Github](https://github.com/search?q=privacy+policy&type=Repositories) for informational resources providing user admittance obstaining from filing any and all law suits related to the product as a whole (hardware, software, security, etc).

###View templates
Search [ThemeForest](http://themeforest.net/category/site-templates/admin-templates?utf8=%E2%9C%93&sort_by=average_rating&categories=site-templates%2Fadmin-templates) for a template that will provide a user interface for interacting with the main components of the product. Be mindful of features such as: user profile settings, token/compromised resets, authentication control, etc.

###Landing Page Content
Provide copy that consisely informs the user on what the product does, it's main features, and provide proof to why these ideas will be beneficial to using such an application. Focus on customer retention. Create an aesthetically pleasant experience.

###Preparing Server
Customize provided [Linode](http://library.linode.com/) server instance for production environment -based application. Install all required libraries/plugins, as they pertain to the development cycle, prior to initial deploy. Such packages might include: Ruby (1.9.2), RubyGems, Postgres, [Whenever](https://github.com/javan/whenever), and [Capistrano](https://github.com/capistrano/capistrano).
