# JupyterHub Docker

JupyterHub allows using the power of notebooks to groups of users. With JupyterHub Docker you will create containers with JupyterHub with NumPy, pandas, Scipy, matplotlib, and Dask for multi-users through a central server.

JupyterHub Docker will provide us an environment with JupyterLab for every user.

This JupyterHub has preinstall pytorch and tensorflow with gpu support and preinstalled oracle client to select from Oracle db.

## Create Container

     $ docker pull 5795162/jupyterhub_cuda
     $ docker run -d --name <your-container-name> -p 8000:8000 --gpus all 5795162/jupyterhub_cuda

Or

     $ git clone (https://github.com/AlexGvr/jupyterhub_cuda
     $ cd jupyterhub_cuda/
     $ docker build -t jupyterhub_cuda .
     $ docker run -d --name <your-container-name> -p 8000:8000 jupyterhub_cuda

In your browser go to:

     http://<server-name-or-ip>:8000

## Access to JupyterHub admin

By default, an admin user is created with the default password **change.it!**, you can access using the following credentials to enter as administrator.

     username: admin
     password: change.it!

**Important:** You must change the default password using the **Terminal** option (go to **File -> New -> Terminal**) and use the following command inside the terminal:

    $ passwd
    Changing password for admin.
    (current) UNIX password:
    Enter new UNIX password:
    Retype new UNIX password:
    passwd: password updated successfully
    $

Don't forget!!! this is **necessary**.

## Creating new users

JupyterHub Docker uses PAMAuthenticator, this allows us to use the Linux account and credentials.

With **admin** account you can create other users.

Go to **Hub Control Panel** (File -> Hub Control Panel), **Admin** menu option, **Add Users** button. Inside Add Users enter the username. You can create a list of user separated by lines

New users will be created with a default password **remember.change.it**. Each user must change their own password using the **Terminal** option (they have to go to **File -> New -> Terminal**) and execute the following command:

    $ passwd
    Changing password for <username>.
    (current) UNIX password:
    Enter new UNIX password:
    Retype new UNIX password:
    passwd: password updated successfully
    $


**username** will be your username. You must write your current password (by default: **remember.change.it**).

