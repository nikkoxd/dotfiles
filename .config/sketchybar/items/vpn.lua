local icons = require("icons")

local vpn = sbar.add("item", "vpn", {
  position = "right",
  label = "VPN",
  icon = {
    drawing = false,
    string = icons.network.vpn
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

        if proxy == "1" then
          vpn:set({
            label = "VPN",
            icon = icons.network.vpn
          })
        else
          vpn:set({
            label = "WiFi",
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
