
# About
SimBaD-Viewer is a fork of  [Potree](http://potree.org), adapted for visualising simulation output.
# Getting Started
### Build and Run
Make sure you have [node.js](http://nodejs.org/) installed

Install all dependencies, as specified in package.json, 
then, install the gulp build tool:

    cd <potree_directory>
    npm install
    npm install -g gulp
    npm install -g rollup

Use the ```gulp watch``` command to 

* create ./build/potree 
* watch for changes to the source code and automatically create a new build on change
* start a web server at localhost:1234. 

```
gulp watch
```

Go to http://localhost:1234/viewer/ to show viewer.
