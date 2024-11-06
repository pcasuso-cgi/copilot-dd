function splitURLandReturnComponents(url) {
    try {
        const urlObj = new URL(url);
        return {
            protocol: urlObj.protocol,
            hostname: urlObj.hostname,
            pathname: urlObj.pathname,
            search: urlObj.search,
            hash: urlObj.hash
        };
    } catch (error) {
        console.error('Invalid URL:', error);
        return null;
    }
}

// Example usage:
const url = 'https://example.com/path?query=123#hash';
const components = splitURLandReturnComponents(url);
console.log(components);
