const chroma = require("chroma-js")

const neutrals = ['CCCCC8', 'AAAAA6', '666662', '444440', '30302C']

const hues = {
  candy: "#CE839F",
  lilac : "#9D7ABD",
  violet: "#8480CC",
  azure: "#5A80BF",
  sapphire: "#2C6888",
  emerald: "#456E3F",
  lime: "#8B995C",
  lemon: "#E8B359",
  orange: "#CE6741",
  crimson: "#B5332C",
  rose: "#B12F54",
}

const factors = {
  brightest: 1,
  bright: 0.5,
  dark: 1,
  darkest: 1.5
}

for (const hueName in hues) {
  const hue = chroma(hues[hueName]);

  console.log(`set -U theme_color_${hueName}_100 ${hue.brighten(factors.brightest).hex().slice(1)}`)
  console.log(`set -U theme_color_${hueName}_200 ${hue.brighten(factors.bright).hex().slice(1)}`)
  console.log(`set -U theme_color_${hueName}_300 ${hue.hex().slice(1)}`)
  console.log(`set -U theme_color_${hueName}_400 ${hue.darken(factors.dark).hex().slice(1)}`)
  console.log(`set -U theme_color_${hueName}_500 ${hue.darken(factors.darkest).hex().slice(1)}`)
  console.log()
}

console.log(`set -U theme_color_neutral_100 ${neutrals[0]}`)
console.log(`set -U theme_color_neutral_200 ${neutrals[1]}`)
console.log(`set -U theme_color_neutral_300 ${neutrals[2]}`)
console.log(`set -U theme_color_neutral_400 ${neutrals[3]}`)
console.log(`set -U theme_color_neutral_500 ${neutrals[4]}`)
