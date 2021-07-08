# Zenodo attachments downloader
__*Automate your download of all attachments to any Zenodo records*__

This is a shell script tool designed for most linux distributions.
The script fetches all attachment links to a Zenodo record and downloads them sequentially automagically. No more clicking one by one!

## What it does

* Checks the Record ID and see if the URL resolves on [zenodo.org](https://zenodo.org)
* Downloads all attachments to the location this script was called from by default, unless provided with a download path by passing --dir|-d argument 
* Saves your mouse click lifespan from mundane clicks

## Requirements

* curl
* sed
* grep

## Quickstart

Clone the repository and run zdl.

Download all attachments given a record _(_-i | --id _parameter is mandatory)_:

`./zdl -i #######`

Provide a download path _(_-d | --dir _parameter is optional)_:

`./zdl -i ####### -d /home/myfolder/downloads`


Cloning the repository should maintain executable permission.
If you just downloaded the script without cloning the repository, double check that `zdl` has executable permission (`chmod +x`).
