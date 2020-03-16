module.exports = {
  theme: {
    fontFamily: {
      'logo': 'Playfair Display',
      'header': 'Rubik'
    },
    extend: {
      flex: {
        '4': '4 1 0%'
      }
    }
  },
  variants: {
    borderWidth: ['responsive', 'first', 'hover', 'focus']
  },
  plugins: [
    require('@tailwindcss/ui'),
  ],
}
