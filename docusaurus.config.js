// @ts-check
// Note: type annotations allow type checking and IDEs autocompletion

const lightCodeTheme = require('prism-react-renderer/themes/github');
const darkCodeTheme = require('prism-react-renderer/themes/dracula');

/** @type {import('@docusaurus/types').Config} */
const config = {
  title: 'DejaVu Editor',
  tagline: 'A template based map editor',
  url: 'https://github.com',
  baseUrl: '/dejavu/',
  onBrokenLinks: 'ignore',
  onBrokenMarkdownLinks: 'warn',
  favicon: 'img/dejavu.png',

  // GitHub pages deployment config.
  // If you aren't using GitHub pages, you don't need these.
  organizationName: 'rukadev', // Usually your GitHub org/user name.
  projectName: 'dejavu', // Usually your repo name.
  deploymentBranch: 'gh-pages',

  // Even if you don't use internalization, you can use this field to set useful
  // metadata like html lang. For example, if your site is Chinese, you may want
  // to replace "en" with "zh-Hans".
  i18n: {
    defaultLocale: 'en',
    locales: ['en'],
  },

  presets: [
    [
      'classic',
      /** @type {import('@docusaurus/preset-classic').Options} */
      ({
        docs: {
          routeBasePath: 'docs',
          path: 'docs',
          sidebarPath: require.resolve('./sidebars.js'),
          // Please change this to your repo.
          // Remove this to remove the "edit this page" links.
          editUrl:
            'https://github.com/rukadev/dejavu',
        },
        theme: {
          customCss: require.resolve('./src/css/custom.css'),
        },
      }),
    ],
  ],

  plugins: [
    [
      '@docusaurus/plugin-content-docs',
      {
        id: 'docs-api',
        path: 'docs-api',
        routeBasePath: 'docs-api',
        sidebarPath: require.resolve('./sidebars.js')
      }
    ],

    [
      '@docusaurus/plugin-content-docs',
      {
        id: 'docs-changelog',
        path: 'docs-changelog',
        routeBasePath: 'docs-changelog',
        sidebarPath: require.resolve('./sidebars.js')
      }
    ],
  ],

  themeConfig:
    /** @type {import('@docusaurus/preset-classic').ThemeConfig} */
    ({
      navbar: {
        title: 'DejaVu Editor',
        logo: {
          alt: 'My Site Logo',
          src: 'img/dejavu.png',
        },
        items: [
          {
            to: '/docs/intro',
            label: 'Docs',
            position: 'left',
            activeBaseRegex: `/docs/`,
          },
          {
            to: '/docs-api/intro',
            label: 'API',
            position: 'left',
            activeBaseRegex: `/docs-api/`,
          },
          {
            to: '/docs-changelog/intro',
            label: 'Changelog',
            position: 'left',
            activeBaseRegex: `/docs-changelog/`,
          },
          {
            href: 'https://github.com/rukadev/dejavu',
            label: 'GitHub',
            position: 'right',
          },
        ],
      },
      footer: {
        style: 'dark',
        copyright: `Copyright © ${new Date().getFullYear()} rukadev. Built with Docusaurus.`,
      },
      prism: {
        theme: lightCodeTheme,
        darkTheme: darkCodeTheme,
      },
    }),
};

module.exports = config;
