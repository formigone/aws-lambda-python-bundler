import pandas as pd


def handler(event, context):
    df = pd.DataFrame({'num': [i for i in range(100)]})
    print('From the docker container...')
    print(df.head())
    return {'num': df.num.tolist()}


if __name__ == '__main__':
    print('in __main__')
    handler({}, {})
