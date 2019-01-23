import {inject} from '@loopback/core';
import {juggler} from '@loopback/repository';
import * as config from './treeandb.datasource.json';

export class TreeandbDataSource extends juggler.DataSource {
  static dataSourceName = 'treeandb';

  constructor(
    @inject('datasources.config.treeandb', {optional: true})
    dsConfig: object = config,
  ) {
    super(dsConfig);
  }
}
