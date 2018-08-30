import requests

def handler(event, context):
    r = requests.get('http://www.google.nl')
    print(r.text)
    return r.text


if __name__ == '__main__':
    handler(None, None)

