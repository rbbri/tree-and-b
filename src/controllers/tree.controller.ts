import {
  Count,
  CountSchema,
  Filter,
  repository,
  Where,
} from '@loopback/repository';
import {
  post,
  param,
  get,
  getFilterSchemaFor,
  getWhereSchemaFor,
  patch,
  put,
  del,
  requestBody,
} from '@loopback/rest';
import {Tree} from '../models';
import {TreeRepository} from '../repositories';

export class TreeController {
  constructor(
    @repository(TreeRepository)
    public treeRepository : TreeRepository,
  ) {}

  @post('/trees', {
    responses: {
      '200': {
        description: 'Tree model instance',
        content: {'application/json': {schema: {'x-ts-type': Tree}}},
      },
    },
  })
  async create(@requestBody() tree: Tree): Promise<Tree> {
    return await this.treeRepository.create(tree);
  }

  @get('/trees/count', {
    responses: {
      '200': {
        description: 'Tree model count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async count(
    @param.query.object('where', getWhereSchemaFor(Tree)) where?: Where,
  ): Promise<Count> {
    return await this.treeRepository.count(where);
  }

  @get('/trees', {
    responses: {
      '200': {
        description: 'Array of Tree model instances',
        content: {
          'application/json': {
            schema: {type: 'array', items: {'x-ts-type': Tree}},
          },
        },
      },
    },
  })
  async find(
    @param.query.object('filter', getFilterSchemaFor(Tree)) filter?: Filter,
  ): Promise<Tree[]> {
    return await this.treeRepository.find(filter);
  }

  @patch('/trees', {
    responses: {
      '200': {
        description: 'Tree PATCH success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async updateAll(
    @requestBody() tree: Tree,
    @param.query.object('where', getWhereSchemaFor(Tree)) where?: Where,
  ): Promise<Count> {
    return await this.treeRepository.updateAll(tree, where);
  }

  @get('/trees/{id}', {
    responses: {
      '200': {
        description: 'Tree model instance',
        content: {'application/json': {schema: {'x-ts-type': Tree}}},
      },
    },
  })
  async findById(@param.path.number('id') id: number): Promise<Tree> {
    return await this.treeRepository.findById(id);
  }

  @patch('/trees/{id}', {
    responses: {
      '204': {
        description: 'Tree PATCH success',
      },
    },
  })
  async updateById(
    @param.path.number('id') id: number,
    @requestBody() tree: Tree,
  ): Promise<void> {
    await this.treeRepository.updateById(id, tree);
  }

  @put('/trees/{id}', {
    responses: {
      '204': {
        description: 'Tree PUT success',
      },
    },
  })
  async replaceById(
    @param.path.number('id') id: number,
    @requestBody() tree: Tree,
  ): Promise<void> {
    await this.treeRepository.replaceById(id, tree);
  }

  @del('/trees/{id}', {
    responses: {
      '204': {
        description: 'Tree DELETE success',
      },
    },
  })
  async deleteById(@param.path.number('id') id: number): Promise<void> {
    await this.treeRepository.deleteById(id);
  }
}
