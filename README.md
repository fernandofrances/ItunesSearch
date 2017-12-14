# Itunes Search App
##### Simple app that lets you search artists through the [itunes library API](https://affiliate.itunes.apple.com/resources/documentation/itunes-store-web-service-search-api/#lookup) and look through their discography.

#### Featured View
This view will show featured artists and albums from the Itunes Library (To do). At the top of the view there is a searchBar the user can use to search artists through Itunes Store.

#### Searching
When the user taps on the SearchBar of the Featured View, a SearchController appears. The Search controller will show results from the search when the user starts typing. If the artists that has been searched has albums avilable in the store, the user may tap the cell and access a detail view of all the artist's albums.

##### Artist Request JSON result:
```javascript
{
	"resultCount": 2,
	"results": [{
		"wrapperType": "artist",
		"artistType": "Artist",
		"artistName": "Jack Johnson",
		"artistLinkUrl": "https://itunes.apple.com/us/artist/jack-johnson/909253?uo=4",
		"artistId": 909253,
		"amgArtistId": 468749,
		"primaryGenreName": "Rock",
		"primaryGenreId": 21
	}]
}
```
##### Albums for artist Request JSON result
Notice that the first element from the *results* array is the artist and the rest of the elements are the albums. Generic type *Discography Result* is required to Decode through this JSON array

```javascript
{
	"resultCount": 24,
	"results": [{
			"wrapperType": "artist",
			"artistType": "Artist",
			"artistName": "Jack Johnson",
			"artistLinkUrl": "https://itunes.apple.com/us/artist/jack-johnson/909253?uo=4",
			"artistId": 909253,
			"amgArtistId": 468749,
			"primaryGenreName": "Rock",
			"primaryGenreId": 21
		},
		{
			"wrapperType": "collection",
			"collectionType": "Album",
			"artistId": 909253,
			"collectionId": 879273552,
			"amgArtistId": 468749,
			"artistName": "Jack Johnson",
			"collectionName": "In Between Dreams",
			"collectionCensoredName": "In Between Dreams",
			"artistViewUrl": "https://itunes.apple.com/us/artist/jack-johnson/909253?uo=4",
			"collectionViewUrl": "https://itunes.apple.com/us/album/in-between-dreams/879273552?uo=4",
			"artworkUrl60": "http://is1.mzstatic.com/image/thumb/Music2/v4/a2/66/32/a2663205-663c-8301-eec7-57937c2d0878/source/60x60bb.jpg",
			"artworkUrl100": "http://is1.mzstatic.com/image/thumb/Music2/v4/a2/66/32/a2663205-663c-8301-eec7-57937c2d0878/source/100x100bb.jpg",
			"collectionPrice": 5.99,
			"collectionExplicitness": "notExplicit",
			"trackCount": 16,
			"copyright": "℗ 2013 Jack Johnson",
			"country": "USA",
			"currency": "USD",
			"releaseDate": "2005-03-01T08:00:00Z",
			"primaryGenreName": "Rock"
		}]
}
```

#### Detail View
Tapping a cell from the searchController of an artists with albums available on the Itunes Store leads you to this detal view that showcases all albums from the artists selected sorted by year.
