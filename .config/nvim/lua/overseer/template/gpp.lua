return {
  name = "Build with g++",
  builder = function()
    return {
      cmd = { "g++" },
      args = { "-o", "main", "main.cpp" },
    }
  end,
  condition = {
    filetype = { "cpp" },
  },
}
