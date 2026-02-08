#----UR:L (https://github.com/Hiroki-Ando1998/Wastewaterscan/tree/main/04_GIS/20250806)

#-------------------------------------------------------------------------------------------------------------------

setwd("C:/xx_wwscan202406_concentration_GIS/Spatial_WWcon")

library(dplyr)
library(tidyr)
library(plyr)
library(tidyverse)
library(ggplot2)

library(tigris)
library(sf)
library(gganimate)
library(av)


# 州境界の取得（sf形式）
states <- states(cb = TRUE)
california <- states[states$NAME == "California", ]

# 郡境界線の取得（sf形式、カリフォルニア州のみ）
options(tigris_use_cache = TRUE)
counties_ca <- counties(state = "CA", cb = TRUE, class = "sf")




#下水データとポリゴンデータの統合

#Alameda
sf_AL <- counties_ca %>% filter(NAME == "Alameda")
data_AL <- read.csv("202406_CA_Alameda_IAV_WWconcentration.csv")
data_AL$normalized <- data_AL$median - 8.692 + 8.8
data_AL$NAME <- "Alameda"
merged_AL <- merge(sf_AL, data_AL, by = "NAME")

#Contracosta
sf_CC <- counties_ca %>% filter(NAME == "Contra Costa")
data_CC <- read.csv("202406_CA_Contracosta_IAV_WWconcentration.csv")
data_CC$normalized <- data_CC$median - 8.851 + 8.8
data_CC$NAME <- "Contra Costa"
merged_CC <- merge(sf_CC, data_CC, by = "NAME")

#LosAngels
sf_LA <- counties_ca %>% filter(NAME == "Los Angeles")
data_LA <- read.csv("202406_CA_LosAngels_IAV_WWconcentration.csv")
data_LA$normalized <- data_LA$median - 8.929 + 8.8
data_LA$NAME <- "Los Angeles"
merged_LA <- merge(sf_LA, data_LA, by = "NAME")

#Madera
sf_MD <- counties_ca %>% filter(NAME == "Madera")
data_MD <- read.csv("202406_CA_Madera_IAV_WWconcentration.csv")
data_MD$normalized <- data_MD$median - 9.04 + 8.8
data_MD$NAME <- "Madera"
merged_MD <- merge(sf_MD, data_MD, by = "NAME")

#Marine
sf_MR <- counties_ca %>% filter(NAME == "Marin")
data_MR <- read.csv("202406_CA_Marine_IAV_WWconcentration.csv")
data_MR$normalized <- data_MR$median - 8.618 + 8.8
data_MR$NAME <- "Marin"
merged_MR <- merge(sf_MR, data_MR, by = "NAME")

#Merced
sf_MC <- counties_ca %>% filter(NAME == "Merced")
data_MC <- read.csv("202406_CA_Merced_IAV_WWconcentration.csv")
data_MC$normalized <- data_MC$median - 9.114 + 8.8
data_MC$NAME <- "Merced"
merged_MC <- merge(sf_MC, data_MC, by = "NAME")

#Mono
sf_MN <- counties_ca %>% filter(NAME == "Mono")
data_MN <- read.csv("202406_CA_Mono_IAV_WWconcentration.csv")
data_MN$normalized <- data_MN$median - 8.911 + 8.8
data_MN$NAME <- "Mono"
merged_MN <- merge(sf_MN, data_MN, by = "NAME")

#Monterey
sf_MT <- counties_ca %>% filter(NAME == "Monterey")
data_MT <- read.csv("202406_CA_Monterey_IAV_WWconcentration.csv")
data_MT$normalized <- data_MT$median - 9.102 + 8.8
data_MT$NAME <- "Monterey"
merged_MT <- merge(sf_MT, data_MT, by = "NAME")

#Napa
sf_NP <- counties_ca %>% filter(NAME == "Napa")
data_NP <- read.csv("202406_CA_Napa_IAV_WWconcentration.csv")
data_NP$normalized <- data_NP$median - 9.242 + 8.8
data_NP$NAME <- "Napa"
merged_NP <- merge(sf_NP, data_NP, by = "NAME")

#Orange
sf_OR <- counties_ca %>% filter(NAME == "Orange")
data_OR <- read.csv("202406_CA_Orange_IAV_WWconcentration.csv")
data_OR$normalized <- data_OR$median - 8.675 + 8.8
data_OR$NAME <- "Orange"
merged_OR <- merge(sf_OR, data_OR, by = "NAME")

#Riverside
sf_RS <- counties_ca %>% filter(NAME == "Riverside")
data_RS <- read.csv("202406_CA_Riverside_IAV_WWconcentration.csv")
data_RS$normalized <- data_RS$median - 9.134 + 8.8
data_RS$NAME <- "Riverside"
merged_RS <- merge(sf_RS, data_RS, by = "NAME")

#Sacramento
sf_SC <- counties_ca %>% filter(NAME == "Sacramento")
data_SC <- read.csv("202406_CA_Sacramento_IAV_WWconcentration.csv")
data_SC$normalized <- data_SC$median - 8.948 + 8.8
data_SC$NAME <- "Sacramento"
merged_SC <- merge(sf_SC, data_SC, by = "NAME")

#San Benito
sf_SB <- counties_ca %>% filter(NAME == "San Benito")
data_SB <- read.csv("202406_CA_SanBenito_IAV_WWconcentration.csv")
data_SB$normalized <- data_SB$median - 9.109 + 8.8
data_SB$NAME <- "San Benito"
merged_SB <- merge(sf_SB, data_SB, by = "NAME")

#SanBenito
sf_SBN <- counties_ca %>% filter(NAME == "San Bernardino")
data_SBN <- read.csv("202406_CA_SanBernarino_IAV_WWconcentration.csv")
data_SBN$normalized <- data_SBN$median - 8.997 + 8.8
data_SBN$NAME <- "San Bernardino"
merged_SBN <- merge(sf_SBN, data_SBN, by = "NAME")



#San Diego
sf_SD <- counties_ca %>% filter(NAME == "San Diego")
data_SD <- read.csv("202406_CA_SanDiego_IAV_WWconcentration.csv")
data_SD$normalized <- data_SD$median - 9.318 + 8.8
data_SD$NAME <- "San Diego"
merged_SD <- merge(sf_SD, data_SD, by = "NAME")


#San Francisco
sf_SF <- counties_ca %>% filter(NAME == "San Francisco")
data_SF <- read.csv("202406_CA_SanFrancisco_IAV_WWconcentration.csv")
data_SF$normalized <- data_SF$median - 8.773 + 8.8
data_SF$NAME <- "San Francisco"
merged_SF <- merge(sf_SF, data_SF, by = "NAME")

#San Luis
sf_SL <- counties_ca %>% filter(NAME == "San Luis Obispo")
data_SL <- read.csv("202406_CA_SanLuis_IAV_WWconcentration.csv")
data_SL$normalized <- data_SL$median - 9.161 + 8.8
data_SL$NAME <- "San Luis Obispo"
merged_SL <- merge(sf_SL, data_SL, by = "NAME")

#San Mateo
sf_SM <- counties_ca %>% filter(NAME == "San Mateo")
data_SM <- read.csv("202406_CA_SanMate_IAV_WWconcentration.csv")
data_SM$normalized <- data_SM$median - 8.775 + 8.8
data_SM$NAME <- "San Mateo"
merged_SM <- merge(sf_SM, data_SM, by = "NAME")

#SantaBaraba
sf_STB <- counties_ca %>% filter(NAME == "Santa Barbara")
data_STB <- read.csv("202406_CA_SantaBarba_IAV_WWconcentration.csv")
data_STB$normalized <- data_STB$median - 9.009 + 8.8
data_STB$NAME <- "Santa Barbara"
merged_STB <- merge(sf_STB, data_STB, by = "NAME")

#SantaClara
sf_STC <- counties_ca %>% filter(NAME == "Santa Clara")
data_STC <- read.csv("202406_CA_SantaClara_IAV_WWconcentration.csv")
data_STC$normalized <- data_STC$median - 9.006 + 8.8
data_STC$NAME <- "Santa Clara"
merged_STC <- merge(sf_STC, data_STC, by = "NAME")

#Santa Cruz
sf_STZ <- counties_ca %>% filter(NAME == "Santa Cruz")
data_STZ <- read.csv("202406_CA_SantaCruz_IAV_WWconcentration.csv")
data_STZ$normalized <- data_STZ$median - 8.678 + 8.8
data_STZ$NAME <- "Santa Cruz"
merged_STZ <- merge(sf_STZ, data_STZ, by = "NAME")

#Solano
sf_SLO <- counties_ca %>% filter(NAME == "Solano")
data_SLO <- read.csv("202406_CA_Solano_IAV_WWconcentration.csv")
data_SLO$normalized <- data_SLO$median - 8.907 + 8.8
data_SLO$NAME <- "Solano"
merged_SLO <- merge(sf_SLO, data_SLO, by = "NAME")

#Sonoma
sf_SN <- counties_ca %>% filter(NAME == "Sonoma")
data_SN <- read.csv("202406_CA_Sonoma_IAV_WWconcentration.csv")
data_SN$normalized <- data_SN$median - 8.884 + 8.8
data_SN$NAME <- "Sonoma"
merged_SN <- merge(sf_SN, data_SN, by = "NAME")

#Stainslaus
sf_SSL <- counties_ca %>% filter(NAME == "Stanislaus")
data_SSL <- read.csv("202406_CA_Stanislaus_IAV_WWconcentration.csv")
data_SSL$normalized <- data_SSL$median - 8.876 + 8.8
data_SSL$NAME <- "Stanislaus"
merged_SSL <- merge(sf_SSL, data_SSL, by = "NAME")

#Yolo
sf_YL <- counties_ca %>% filter(NAME == "Yolo")
data_YL <- read.csv("202406_CA_Yolo_IAV_WWconcentration.csv")
data_YL$normalized <- data_YL$median - 8.883 + 8.8
data_YL$NAME <- "Yolo"
merged_YL <- merge(sf_YL, data_YL, by = "NAME")

#統合
AL_WW <- select(merged_AL, "NAME", "date", "median", "normalized", "geometry")
CC_WW <- select(merged_CC, "NAME", "date", "median", "normalized","geometry")
LA_WW <- select(merged_LA, "NAME", "date", "median", "normalized","geometry")
MD_WW <- select(merged_MD, "NAME", "date", "median", "normalized","geometry")
MR_WW <- select(merged_MR, "NAME", "date", "median", "normalized","geometry")
MC_WW <- select(merged_MC, "NAME", "date", "median", "normalized","geometry")
MN_WW <- select(merged_MN, "NAME", "date", "median", "normalized","geometry")
MT_WW <- select(merged_MT, "NAME", "date", "median", "normalized","geometry")
NP_WW <- select(merged_NP, "NAME", "date", "median", "normalized","geometry")
OR_WW <- select(merged_OR, "NAME", "date", "median", "normalized","geometry")
RS_WW <- select(merged_RS, "NAME", "date", "median", "normalized","geometry")
SC_WW <- select(merged_SC, "NAME", "date", "median", "normalized","geometry")
SB_WW <- select(merged_SB, "NAME", "date", "median", "normalized","geometry")
SBN_WW <- select(merged_SBN, "NAME", "date", "median", "normalized","geometry")
SD_WW <- select(merged_SD, "NAME", "date", "median", "normalized","geometry")
SF_WW <- select(merged_SF, "NAME", "date", "median", "normalized","geometry")
SL_WW <- select(merged_SL, "NAME", "date", "median", "normalized","geometry")
SM_WW <- select(merged_SM, "NAME", "date", "median", "normalized","geometry")
STB_WW <- select(merged_STB, "NAME", "date", "median", "normalized","geometry")
STC_WW <- select(merged_STC, "NAME", "date", "median", "normalized","geometry")
STZ_WW <- select(merged_STZ, "NAME", "date", "median", "normalized","geometry")
SLO_WW <- select(merged_SLO, "NAME", "date", "median", "normalized","geometry")
SN_WW <- select(merged_SN, "NAME", "date", "median", "normalized","geometry")
SSL_WW <- select(merged_SSL, "NAME", "date", "median", "normalized","geometry")
YL_WW <- select(merged_YL, "NAME", "date", "median", "normalized","geometry")


all_sewershed <- rbind(AL_WW, CC_WW, LA_WW, MD_WW, MR_WW, MC_WW, MN_WW,
                       MT_WW, NP_WW, OR_WW, RS_WW, SC_WW, SB_WW, SBN_WW, SD_WW,
                       SF_WW, SL_WW, SM_WW, STB_WW, STC_WW, STZ_WW, SLO_WW,
                       SM_WW, STB_WW, STC_WW, STZ_WW, SLO_WW, SN_WW, SSL_WW, YL_WW)
all_sewershed$date <- as.Date(all_sewershed$date)
all_sewershed <- subset(all_sewershed, !is.na(date))


#Animationの範囲を調節
start_date <- as.Date("2022-08-01")
end_date <- as.Date("2024-06-10")
all_sewershed <- all_sewershed %>% filter(date >= start_date & date <= end_date)

# Animationのためにdate列で昇順に並べ替え
all_sewershed <- all_sewershed %>% arrange(date)   

#animation

animated_plot <- ggplot() + geom_sf(data = california, fill = "#F0F0F0", color = NA)
animated_plot <- animated_plot + geom_sf(data = counties_ca, fill = NA, color = "#BDBDBD", linewidth = 0.5) 
animated_plot <- animated_plot + geom_sf(data = all_sewershed, aes(fill = median, group = NAME), color = NA, alpha = 0.7) 
animated_plot <- animated_plot + scale_fill_gradient2(name = NULL,low = "#3690C0", mid = "#F9AFAE", high = "#D53E4F", midpoint = 4, limits = c(2.7, 5.3)) #mid-colour: #FADBD8, #F9AFAE, #FFF4C1
animated_plot <- animated_plot + labs(title = "{frame_time}") #(,subtitle = "2022-07-01, 2024-06-31")
animated_plot <- animated_plot + transition_time(date) + ease_aes("linear") + theme_void() + coord_sf(expand = FALSE)
animated_plot <- animated_plot + theme(
    text = element_text(size = 14),
    legend.position = c(0.80, 0.80),
    legend.key.size = unit(2, "cm"),         # 凡例の色四角を大きく
    legend.spacing.y = unit(0.25, "cm"),      # 凡例項目の縦間隔を広げる
    legend.box.spacing = unit(1, "cm"),      # 凡例ボックスと他要素の間隔
    legend.text = element_text(size = 18),   # 凡例ラベルのサイズ
    plot.title = element_text(size = 28, face = "bold"),      # タイトル大きく太字に
    plot.subtitle = element_text(size = 16)
  )


#フレームの数
interval <- 1 #X日ごとに表示する

days_count <- as.numeric(end_date - start_date) + 1
n_days <- round(days_count/interval)
#フリップの数: #fps: 1秒に5フレーム
fps <- 10

animate(animated_plot, nframes = n_days, fps = fps, width = 600, height = 700)






# GIF or MP4で保存
anim_save("wastewater_animation.mp4", animation = animated_plot, renderer = av_renderer(),
  nframes = n_days, fps = fps, width = 700, height = 600,  ffmpeg_opts = c(
    "-crf", "18",
    "-pix_fmt", "yuv420p"))
