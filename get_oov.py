# this program obtain the list of OOV from ref and hyp files

import argparse

parser = argparse.ArgumentParser(description='obtain a list of OOV from ref and hyp files\n'
                                             'i.e., the words in ref but not in hyp.')
parser.add_argument('--ref', type=argparse.FileType(mode='r', encoding='utf-8'),
                    help='reference file.', required=True)
parser.add_argument('--hyp', type=argparse.FileType(mode='r', encoding='utf-8'),
                    help='hypothesis file.', required=True)
parser.add_argument('--oov', type=argparse.FileType(mode='w', encoding='utf-8'),
                    help='oov file.', required=True)


def dump_oov(ref_file, hyp_file, oov_file):
    ref_lines = ref_file.readlines()
    hyp_lines = hyp_file.readlines()
    print('ref lines: {}.\t hyp lines: {}'.format(len(ref_lines), len(hyp_lines)))
    oov_set = set()
    for r, h in zip(ref_lines, hyp_lines):
        ref_words = set(r.split())
        hyp_words = set(h.split())
        print('ref_words', ref_words)
        print('hyp_words', hyp_words)
        oov_words = ref_words - hyp_words
        print('oov_words', oov_words)
        for item in oov_words:
            oov_set.add(item)
    for word in oov_set:
        oov_file.write(word + "\n")


if __name__ == '__main__':
    args = parser.parse_args()
    dump_oov(args.ref, args.ref, args.oov)
