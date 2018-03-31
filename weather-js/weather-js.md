### Introduction

Using `fetch`, retrieve the current weather conditions from
[DarkSky](https://darksky.net/dev/docs/forecast) and print them to the page.


### Instructions

1. Create a [new account](https://darksky.net/dev/register) on DarkSky to get an API key.
2. Find the latitude and longitude of the location for which you would like to monitor the weather conditions.
3. Use `fetch` to issue a HTTP GET request for the following URL:

    ```no-highlight
    https://api.darksky.net/forecast/[your-api-key]/[latitude],[longitude]
    ```

    As an example, here is the URL for accessing the weather data for Boston, MA.

    **Note:** You will need to replace the API key with your own.

    ```no-highlight
    https://api.darksky.net/forecast/ee2c48a4ce24ca555a0ef6f9436f1b22/42.35,-71.07
    ```

4. Insert the current temperature and conditions into the page.
5. **Optional:** Take it a step further by integrating [Skycons](http://darkskyapp.github.io/skycons/) into your webapp. This dependency has been added to the `<head>` tag within `index.html`. So you can use it, straight away.
