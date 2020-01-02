
#!/usr/bin/python

import base64
from io import BytesIO
import requests

username = "My Verofficeplace Username"
password = "My Verofficeplace Password"

with open("image1.jpg", "rb") as image_file1:
    data1 = base64.b64encode(image_file1.read())


with open("image2.jpg", "rb") as image_file2:
    data2 = base64.b64encode(image_file2.read())

url = 'https://www.vrofficeplace.com/admin/api/faceapi.php'
payload = {'username': username, 'password': password, 'image1': data1, 'image2': data2}

r = requests.post(url, data=payload)


# Response, status etc
print(r.text)
print(r.status_code)

