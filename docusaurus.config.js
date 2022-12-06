// @ts-check
// Note: type annotations allow type checking and IDEs autocompletion


const darkCodeTheme = require('prism-react-renderer/themes/vsDark');

//Some constants
const REPO_NAME = "RoactMotion"
const PROFILE_NAME = "prooheckcp"

/** @type {import('@docusaurus/types').Config} */
const config = {
  plugins: [

  ],

  title: REPO_NAME,
  tagline: 'Animate your UI today!',
  url: 'https://prooheckcp.github.io',
  baseUrl: `/${REPO_NAME}/`,
  onBrokenLinks: 'throw',
  onBrokenMarkdownLinks: 'warn',
  favicon: 'img/RoactMotionIcon.ico',

  organizationName: PROFILE_NAME,
  projectName: REPO_NAME,
  trailingSlash: false,

  i18n: {
    defaultLocale: 'en',
    locales: ['en'],
  },

  presets: [
    [
      'classic',
      /** @type {import('@docusaurus/preset-classic').Options} */
      (
        {
        docs: {
          sidebarPath: require.resolve('./sidebars.js'),
        },
        blog: false,
        theme: {
          customCss: require.resolve('./src/css/custom.css'),
        },
      }),
    ],
  ],

  themeConfig:
    /** @type {import('@docusaurus/preset-classic').ThemeConfig} */
    ({
      image: "img/Thumbnail.png",
      colorMode: {
        defaultMode: 'dark',
        disableSwitch: false,
        respectPrefersColorScheme: false,
      },

      navbar: {
        title: 'Home', //Change this to website title
        hideOnScroll: true,
        logo: {
          alt: 'My Site Logo',
          src: 'img/RoactMotionIcon.png', //Path to the logo on the search bar
        },
        items: [
          {
            type: 'doc',
            docId: 'docs/About',
            position: 'left',
            label: 'Docs',
          },
          {
            type: 'doc',
            docId: 'api/apiIntroduction',
            position: 'left',
            label: 'API',
          },
          {
            href: `https://github.com/${PROFILE_NAME}/${REPO_NAME}`,
            label: 'GitHub',
            position: 'right',
          },         
        ],
      },
      footer: {
        style: 'dark',
        logo: {
          alt: 'Prooheckcp name logo',
          src: 'img/prooheckcp.png',
          href: 'https://prooheckcp.com',
          width: 160,
          height: 51,
        },
        links: [
          {
            label: '📹Youtube',
            href: 'https://www.youtube.com/prooheckcp',
          },
          {
            label: '🏰Discord',
            href: 'https://discord.com/invite/2ddmryH',
          },
          {
            label: '🐦Twitter',
            href: 'https://twitter.com/prooheckcp',
          },
          {
            label: '💻GitHub',
            href: 'https://github.com/prooheckcp',
          }
        ],
        copyright: `Copyright © ${new Date().getFullYear()} Prooheckcp`
      },
      prism: {
        theme: darkCodeTheme,
        darkTheme: darkCodeTheme,
        additionalLanguages: ['powershell', 'lua']
      },

      custom_edit_url: null,
      editCurrentVersion: false,

      docs: {
        sidebar: {
          hideable: true,
        },
      },
    }),
};

module.exports = config;
