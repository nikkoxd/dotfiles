local get_url = ya.sync(function()
  local tab = cx.active
  local url = tostring(tab.current.hovered.url)
  return url
end)

return {
  entry = function(self, job)
    ya.dbg(job.args)
    local url = get_url()
    if (job.args.light == true) then
      Command("matu"):arg("-i"):arg(url):arg("-l"):output()
    else
      Command("matu"):arg("-i"):arg(url):output()
    end
  end
}
