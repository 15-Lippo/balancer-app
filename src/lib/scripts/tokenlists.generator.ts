import TokenListService from '@/services/token-list/token-list.service';
import { TOKEN_LIST_MAP } from '@/constants/tokenlists';

const fs = require('fs');
const path = require('path');

<<<<<<< HEAD
const UNISWAP_TOKEN_LIST_URL = 'https://raw.githubusercontent.com/Uniswap/token-lists/master/src/tokens/mainnet.json';

=======
>>>>>>> 7487bda51304bd4804ce8be1ca2756ab564febd3
if (process.env.NODE_ENV === 'development') {
  require('dotenv').config({
    path: path.resolve(__dirname, '../../../.env.development'),
  });
} else {
  require('dotenv').config();
}

async function generate() {
  Object.keys(TOKEN_LIST_MAP).forEach(async networkId => {
    console.log(`Generating tokenlist for network ${networkId}...`);
    const tokenListService = new TokenListService(networkId);
    // check if any uris are avaialble
    if (tokenListService.uris.All.find(uri => !!uri)) {
      const tokenlists = await tokenListService.getAll();
      fs.writeFileSync(
        `./src/assets/data/tokenlists/tokens-${networkId}.json`,
        JSON.stringify(tokenlists)
      );
    }
  });
}

(async () => {
  try {
    console.log('⏳ Generating tokenlists...');
    await generate();
    console.log('✅ Generated tokenlists at /src/assets/data/tokenlists/*');
  } catch (error) {
    console.error('Failed to generate tokenlists:', error);
    process.exit(1);
  }
})();
