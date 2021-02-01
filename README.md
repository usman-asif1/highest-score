# Highest Score

This program outputs the N highest record IDs & scores by score in descending order, highest score first. The output is correctly formatted JSON. The program takes the file path of the data file as it's first parameter, and
number of scores to return as it's second parameter

## Pre-requisites


```bash
ruby
```

## Installation

Clone the git repository and open the folder in terminal.
Run following commmands

```bash
chmod +x highest.rb
```

## Usage

```
./highest.rb [path to file] [scores to fetch count]
```
Example
```
./highest.rb mockdata/test-data.data 3
```
Should output something like
```
[
  {
    "score": 13314012,
    "id": "185a11e1b82b441184f4a193a3c9a13c"
  },
  {
    "score": 13214012,
    "id": "2-085a11e1b82b441184f4a193a3c9a13c"
  },
  {
    "score": 12027069,
    "id": "g812d487de244023a6a713e496a8427d"
  }
]
```
