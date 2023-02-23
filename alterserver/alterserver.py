# Alter Flask Endoint
# This will simply return the name of the currently fronting alter
# Main purpose of putting this on it's own server is to allow me to quickly use it from
# anywhere to simply pull currently fronting name without fussing with auth
# I run this on a cheap linode 
# Robin Universe [T]
# 02 . 17 . 23

import requests
import json
from flask import Flask
app = Flask(__name__)

@app.route('/front')
def get_data():
    headers = {"Authorization":"THIS IS WHERE YOU PUT YOUR AUTH API KEY THINGY"}
    resp = requests.get('https://api.pluralkit.me/v2/systems/YOURSYSTEMID/fronters', headers=headers).json()
    members = resp['members'][0]
    name = members['name']
    return(name)

if __name__ =='__main__':
    app.run(host='0.0.0.0', port=80)
