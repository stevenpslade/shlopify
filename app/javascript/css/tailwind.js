const defaultTheme = require('tailwindcss/defaultTheme');

module.exports = {
  theme: {
    fontFamily: {
      sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      logo: 'Playfair Display',
      header: 'Rubik',
    },
    extend: {
      flex: {
        '4': '4 1 0%'
      },
      colors: {
        'gray-900-75': 'rgba(22, 30, 46, 0.75)',
      },
    }
  },
  variants: {
    borderWidth: ['responsive', 'first', 'hover', 'focus']
  },
  plugins: [
    require('@tailwindcss/ui'),
  ],
}
