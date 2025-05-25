return {
  name = "Build with CMake",
  builder = function()
    return {
      cmd = { "cmake" },
      args = { "--build", "build" },
    }
  end,
  condition = {
    filetype = { "cpp" },
  },
}
