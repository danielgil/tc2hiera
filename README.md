tc2hiera
========

Simple gem to parse command line input and write it to YAML, f.e. to integrate Teamcity build configurations and Hiera

Example usage:

    tc2hiera -f /path/to/file.yaml key1 value1 key2 value2
 
Contents of file.yaml:
```
---
key1: value1
key2: value2
 ```
