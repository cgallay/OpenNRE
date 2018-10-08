import spacy
import hashlib
import pickle
import json

id2Word = dict()
def getID(s):
    global id2Word
    uid = hashlib.md5(s.encode()).hexdigest()[-6:]
    id2Word[uid] = s
    return uid

def saveId2WordDict():
    pickle.dump(id2Word, open('pickles/id2Word.pkl', 'wb'))
def loadId2WordDict():
    return pickle.load(open('pickles/id2Word.pkl', 'rb'))
def getid2rel():
    rel2id = json.loads(open("data/nyt/rel2id.json", 'rb').read())
    return { uid: rel for rel, uid in rel2id.items()}

def load_model():
    return spacy.load('en_coref_lg')

def clean_text(text):
    return text.replace("\n", " ")

def resolve_coref(text, nlp):
    """
    :param text String of text where to resolve coreference.
    :return: A text String where the coreference has been resolved.
    """
    doc = nlp(text)
    return doc._.coref_resolved    

def get_entities(sent):
    """
    :param sent: A parsed sentence by Spacy
    :return: all the entities present in the sentence
    """
    return [ent for ent in sent.ents if ent.label_ in ['PERSON', 'ORG', 'DATE', 'NORP', 'EVENT']]

def get_sentence(text, nlp):
    lines = []
    for sentence in nlp(text).sents:
        sentence = sentence.as_doc()
        sent = " ".join([str(t) for t in sentence])
        ents = get_entities(sentence)
        for e1 in ents:
            for e2 in ents:
                if e1 != e2:
                    json_sent = {
                        'sentence': sent,
                        'head': {'word': e1.text, 'id': getID(e1.text)},
                        'tail': {'word': e2.text, 'id': getID(e2.text)},
                        'relation': 'NA' #set to NA as it has to be disovered
                    }
                    lines.append(json_sent)
    return lines

def readTextFile(filename='test.txt'):
    with open(filename, 'r') as myfile:
        text=myfile.read()#.replace('\n', '')
    return text

def writeLines(data,outfile="test.json"):
    import json
    with open('test.json', 'w') as outfile:
        json.dump(data, outfile)