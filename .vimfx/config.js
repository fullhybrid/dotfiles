// ZOOM STUFF
vimfx.addCommand({
	  name: 'zoom_out',
	  description: 'Zoom out',
}, ({vim}) => {
	  vim.window.FullZoom.reduce()
})

vimfx.addCommand({
	  name: 'zoom_in',
	  description: 'Zoom in',
}, ({vim}) => {
	  vim.window.FullZoom.enlarge()
})

vimfx.addCommand({
	  name: 'zoom_reset',
	  description: 'Zoom reset',
}, ({vim}) => {
	  vim.window.FullZoom.reset()
})

// Search Bookmarks
let {commands} = vimfx.modes.normal
vimfx.addCommand({
	  name: 'search_tabs',
	  description: 'Search tabs',
	  category: 'tabs',
	  order: commands.focus_location_bar.order + 1,
}, (args) => {
	  let {vim} = args
	  let {gURLBar} = vim.window
	  gURLBar.value = ''
	  commands.focus_location_bar.run(args)
	// Change the `*` on the text line to a `%` to search tabs instead of bookmarks.
 gURLBar.value = '* '
	  gURLBar.onInput(new vim.window.KeyboardEvent('input'))
})

//bookmark page
vimfx.addCommand({
	  name: 'bookmark_page',
	  description: 'Bookmark page',
}, ({vim}) => {
	  let {window} = vim
	  window.PlacesCommandHook.bookmarkCurrentPage(true, window.PlacesUtils.bookmarksMenuFolderId)
})


