# Exponential Heap Usage with Large Variable

This issue originally appeared when reading a large dataset from a database query. However, the behavior appears the same when reading a file from disk.

The file used to demonstrate the issue is about 38.9 MB. It's formatted as JSON, but is just being read as text to a variable:

```cfc
filePath = expandPath('./history.json');
content = fileRead( filePath );
```

Just reading this variable increases the heap from about 54mb to about 370mb. If the variable is read and output, the heap increases to about 600mb - more than 15x the size of the variable.

You can see this by using CommandBox to start up a server in the root of this project and following the steps. Thanks to [this awesome project by @foundeo](https://github.com/foundeo/cfmetrics), there's a page that will display the heap usage without needing to use external tools like FusionReactor.
