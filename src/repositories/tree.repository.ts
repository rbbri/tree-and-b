import {DefaultCrudRepository, juggler} from '@loopback/repository';
import {Tree} from '../models';
import {TreeandbDataSource} from '../datasources';
import {inject} from '@loopback/core';

export class TreeRepository extends DefaultCrudRepository<
  Tree,
  typeof Tree.prototype.id
> {
  constructor(
    @inject('datasources.treeandb') dataSource: TreeandbDataSource,
  ) {
    super(Tree, dataSource);
  }
}
