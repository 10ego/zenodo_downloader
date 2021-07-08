# Zenodo attachments downloader
__*Automate your download of all attachments to any Zenodo records*__

This is a shell script tool designed for most linux distributions.
The script fetches all attachment links to a Zenodo record and downloads them sequentially automagically. No more clicking one by one!

## What it does

* Checks the Record ID and see if the URL resolves on [zenodo.org](https://zenodo.org)
* Downloads all attachments to the location this script was called from by default unless provided with a download path by passing --dir|-d argument 
* Saves your mouse click lifespan from mundane clicks

## Requirements

* grep
* sed
* curl

## Quickstart

Download the bashfile and run it alongside a Zenodo Record ID like so:

`zdl.sh -i #######`

Provide a download path:

`zdl.sh -i ####### -d /home/myfolder/downloads`

Don't forget to `chmod +x` on the .sh file
