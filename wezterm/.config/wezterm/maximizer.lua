-- #Maximizer
local Maximizer = {}

---Maximize window on startup
---@param wez table Wezterm Instance
---@param all_windows table `mux_windows` list
---@param window table current window for t (mostly when windows are closed)he event
---@param store_name string name for the `GLOBAL` persistent data store
function Maximizer.Run(wez, all_windows, window, store_name)
	-- grab the store instance, otherwise create it
	local mx_store = wez.GLOBAL[store_name] or { _windows = {}, _length = 0 }

	local w_id = tostring(window:window_id())
	-- only if window id is not present
	if mx_store._windows[w_id] == nil then
		print("Maximize")
		window:maximize()
		mx_store._windows[w_id] = w_id
		mx_store._length = mx_store._length + 1
		wez.GLOBAL[store_name] = mx_store
		return -- store the changes and return
	end

	--Cleanup (mostly when windows are closed)
	if mx_store._length ~= #all_windows then
		-- HACK: when the lengths differ use `all_windows` as source of truth
		print("Different lengths")
		mx_store._length = #all_windows
		for _, win in ipairs(all_windows) do
			local id = tostring(win:window_id())
			mx_store._windows[id] = id
		end
		wez.GLOBAL[store_name] = mx_store
		return
	end
end

return Maximizer
