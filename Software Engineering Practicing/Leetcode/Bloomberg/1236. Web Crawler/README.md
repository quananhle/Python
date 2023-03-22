[1236. Web Crawler](https://leetcode.com/problems/web-crawler/)

```Tag```:

#### Difficulty: Medium

Given a url ```startUrl``` and an interface ```HtmlParser```, implement a web crawler to crawl all links that are under the same hostname as ```startUrl```. 

Return all urls obtained by your web crawler in any order.

Your crawler should:

- Start from the page: ```startUrl```
- Call ```HtmlParser.getUrls(url)``` to get all urls from a webpage of given url.
- Do not crawl the same link twice.
- Explore only the links that are under the same hostname as ```startUrl```.

![image](https://assets.leetcode.com/uploads/2019/08/13/urlhostname.png)

As shown in the example url above, the hostname is ```example.org```. For simplicity sake, you may assume all urls use http protocol without any port specified. For example, the urls ```http://leetcode.com/problems``` and ```http://leetcode.com/contest``` are under the same hostname, while urls ```http://example.org/test``` and ```http://example.com/abc``` are not under the same hostname.

The ```HtmlParser``` interface is defined as such: 

```Java
interface HtmlParser {
  // Return a list of all urls from a webpage of given url.
  public List<String> getUrls(String url);
}
```

Below are two examples explaining the functionality of the problem, for custom testing purposes you'll have three variables ```urls```, ```edges``` and ```startUrl```. Notice that you will only have access to ```startUrl``` in your code, while ```urls``` and ```edges``` are not directly accessible to you in code.

Note: Consider the same URL with the trailing slash "/" as a different URL. For example, "http://news.yahoo.com", and "http://news.yahoo.com/" are different urls.

---

