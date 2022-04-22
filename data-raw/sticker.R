library(hexSticker)
library(magick)
library(dplyr)
library(showtext)


font_add_google("Akshar", family = "Sans Serif", db_cache = FALSE)

img <- image_read("data-raw/IPL-PNG-Logo.jpg")

res <- img %>%
  image_convert("png") %>%
  image_resize("1080 x 200")


ipl_sticker <- sticker(
  subplot = res,
  s_x = 1,
  s_height = 1.2,
  s_width = 1.2,
  package = "ipl",
  p_color = "#191970",
  #p_color = "#252525",
  h_fill = "#FFFFFF",
  h_color = "#191970",
  h_size = 1.5,
  p_y = 1.6,
  p_family = "Sans Serif"
)


save_sticker(here::here("data-raw", "hex_ipl.png"), ipl_sticker)


































