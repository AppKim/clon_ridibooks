import Vibrant from 'node-vibrant'

export const useVibrant = () => {
  const getPaletteData = async (imgUrl) => {
    const image = new Image()
    image.crossOrigin = 'Anonymous'
    image.src = imgUrl
    const paletteData = await Vibrant.from(image).getPalette()
    return paletteData
  }
  return {
    getPaletteData,
  }
}
