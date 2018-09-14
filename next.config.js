// next.config.js



const withPlugins = require('next-compose-plugins');
const withSass = require('@zeit/next-sass')

const nextConfig = {
    // distDir: 'build',
    webpack: (config, options) => {
        config.module.rules.push(
            {
                test: /\.(jpe?g|png|svg|gif)$/,
                use: [
                    {
                        loader: "url-loader",
                        options: {
                            limit: 8192,
                            fallback: "file-loader",
                            publicPath: "/_next/static/images/",
                            outputPath: "static/images/",
                            name: "[name]-[hash].[ext]"
                        }
                    }
                ]
            }
        )
        return config;
    },
};

module.exports = withPlugins([
    [
        withSass, {}
    ]
], nextConfig);