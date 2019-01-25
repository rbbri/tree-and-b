import {TreeAndBApplication} from '../..';
import {Client, createRestAppClient, expect} from '@loopback/testlab';
import {givenEmptyDatabase, givenTree} from '../helpers/database.helpers';
import {RestServer, RestBindings} from '@loopback/rest';
import {testdb} from '../fixtures/datasources/testdb.datasource';

describe('Trees (acceptance)', () => {
  let app: TreeAndBApplication;
  let client: Client;

  before(givenEmptyDatabase);
  before(givenRunningApp);
  after(async () => {
    await app.stop();
  });

  it('retrieves tree details', async () => {
    const tree = await givenTree({
      title: 'test_tree',
      location: 'my_place',
    });
    const expected = Object.assign({id: tree.id}, tree);

    const response = await client.get('/trees/1');

    expect(response.body).to.containEql(expected);
  });

  async function givenRunningApp() {
    app = new TreeAndBApplication({
      rest: {
        port: 0,
      },
    });
    app.dataSource(testdb);
    await app.boot();
    await app.start();

    client = createRestAppClient(app);
  }
})
