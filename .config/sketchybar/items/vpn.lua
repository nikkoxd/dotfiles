local icons = require("icons")

local vpn = sbar.add("item", "vpn", {
  position = "right",
  label = {
    string = "Unknown",
    drawing = false,
  },
  icon = {
    drawing = true,
    string = icons.network.vpn,
    padding_right = 0,
  },
  update_freq = 10,
})

vpn:subscribe({ "forced", "routine", "wifi_change", "system_woke" }, function()
  ---@param net_info string
  sbar.exec("scutil --nwi", function(net_info)
    if net_info:match("en0") then
      ---@param proxy_info string
      sbar.exec("scutil --proxy", function(proxy_info)
        local _, _, proxy = proxy_info:find("SOCKSEnable : (%d)")
        local ip = net_info:match("address: (.*)")

        if proxy == "1" then
          vpn:set({
            label = ip,
            icon = icons.network.vpn
          })
        else
          vpn:set({
            label = ip,
            icon = icons.network.connected
          })
        end
      end)
    else
      vpn:set({
        label = "-",
        icon = icons.network.disconnected
      })
    end
  end)
end)
