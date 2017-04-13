#!/usr/bin/env python
"""
Adds a clickable button to i3 that lets you change your desktop to a random cat.
"""
import subprocess
import requests


class Py3status:

    def cat_click(self):
        return {
            'full_text': ':3',
            'cached_until': self.py3.CACHE_FOREVER
        }

    def on_click(self, event):
        r = requests.get('http://random.cat/meow')
        if r.status_code == 200:
            if r.headers['content-type'] == 'application/json; charset=utf8'
                if r.encoding == 'utf-8':
                    catdata = r.json()
                    if 'file' in catdata:
                        subprocess.call('feh', '--bg-center', str(catdata['file']))
