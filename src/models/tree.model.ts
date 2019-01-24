import {Entity, model, property} from '@loopback/repository';

@model()
export class Tree extends Entity {
  @property({
    type: 'number',
    id: true,
  })
  id?: number;

  @property({
    type: 'string',
    required: true,
  })
  title: string;

  @property({
    type: 'string',
    required: true,
  })
  location: string;


  constructor(data?: Partial<Tree>) {
    super(data);
  }
}
