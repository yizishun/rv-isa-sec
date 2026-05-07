this makes it easier to differentiate which
cfg of this hook is running since there are multiple

previously looked like this: 

```
Validate files with jsonschema...........................................Passed
Validate files with jsonschema...........................................Passed
Validate files with jsonschema...........................................Passed
Validate files with jsonschema...........................................Passed
```


now this: 

```
Validate instruction files with jsonschema...........(no files to check)Skipped
Validate CSR files with jsonschema...................(no files to check)Skipped
Validate extension files with jsonschema.............(no files to check)Skipped
Validate cert model files with jsonschema............(no files to check)Skipped
Validate cert class files with jsonschema............(no files to check)Skipped
```
