
if !empty($WAYLAND_DISPLAY) 
  let g:clipboard = {
	\   'name': 'wayland',
	\   'copy': {
	\      '+': 'wl-copy --foreground --type text/plain',
	\      '*': 'wl-copy --foreground --type text/plain --primary',
	\    },
	\   'paste': {
	\      '+': {-> systemlist('wl-paste')},
	\      '*': {-> systemlist('wl-paste --primary')},
	\   },
	\   'cache_enabled': 1,
	\ }
endif
