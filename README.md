A news app that pulls live RSS feeds through a REST API and keeps refreshing, so new stories appear as they are published. Readers choose a category and get a feed built around the topics they care about.
Built with: REST API, RSS feeds, HTML and CSS.

What the app does
Pulls news from RSS feeds delivered through a REST API.
Refreshes automatically, so readers see new stories without reloading by hand.
Lets readers pick a category and shows a feed for that category only.
Presents stories in a clean layout built with HTML and CSS.
How it works
The reader opens the app and picks a news category.
The app sends a request to the REST API for that category's RSS feed.
The RSS items (headline, summary, link and publish time) are read and shown on screen.
The app checks the API again. This happens by normal refreshing of the app to implement the command to refresh.

API and feeds
Item	Details
API used	[REST (Representational State Transfer)]
Endpoint	[HTTP/HTTPS]
Format	RSS
Categories	[Business, Technology, Sports, Health]
API key needed	[Yes]


What I learned
How to consume a REST API and work with RSS data in a real app.
How to keep a feed up to date by refreshing for new content.
How to organise content by category so each reader sees what matters to them.
How to keep a project tidy on GitHub with version control.
Ideas for next steps
Add search across stories
Let readers save favourite stories
Add a backend service to cache feeds and reduce repeated API calls
Author

Ousa Eddy Olivier IT graduate, Kabarak University GitHub: github.com/OusaEddy LinkedIn: linkedin.com/in/eddy-ousa-1a9284336
