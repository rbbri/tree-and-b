import {TreeRepository} from '../../src/repositories';
import {Tree} from '../../src/models';
import {testdb} from '../fixtures/datasources/testdb.datasource';

export async function givenEmptyDatabase() {
  await new TreeRepository(testdb).deleteAll();
}

export function givenTreeData(data?: Partial<Tree>) {
  return Object.assign(
    {
      title: 'a-test-tree',
      location: 'my-yard',
    },
    data,
  );
}

export async function givenTree(data?: Partial<Tree>) {
  return await new TreeRepository(testdb).create(givenTreeData(data));
}
