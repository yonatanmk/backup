---
http_interactions:
- request:
    method: get
    uri: http://freegeoip.net/json/8.8.8.8
    body:
      encoding: US-ASCII
      string: ''
    headers:
      Accept-Encoding:
      - gzip;q=1.0,deflate;q=0.6,identity;q=0.3
      Accept:
      - '*/*'
      User-Agent:
      - Ruby
      Host:
      - freegeoip.net
  response:
    status:
      code: 200
      message: OK
    headers:
      Access-Control-Allow-Credentials:
      - 'true'
      Access-Control-Allow-Methods:
      - GET, HEAD, OPTIONS
      Access-Control-Allow-Origin:
      - '*'
      Content-Type:
      - application/json
      X-Database-Date:
      - Wed, 02 Dec 2015 07:06:47 GMT
      X-Ratelimit-Limit:
      - '10000'
      X-Ratelimit-Remaining:
      - '9995'
      X-Ratelimit-Reset:
      - '3568'
      Date:
      - Mon, 07 Dec 2015 13:57:10 GMT
      Content-Length:
      - '248'
    body:
      encoding: UTF-8
      string: |
        {"ip":"8.8.8.8","country_code":"US","country_name":"United States","region_code":"CA","region_name":"California","city":"Mountain View","zip_code":"94040","time_zone":"America/Los_Angeles","latitude":37.3845,"longitude":-122.0881,"metro_code":807}
    http_version: 
  recorded_at: Mon, 07 Dec 2015 13:57:10 GMT
recorded_with: VCR 2.5.0
