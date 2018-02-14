#!/home/STools/RLX-RHEL4/bin/python3
# This script splits llvm log by function and pass.
# It will create a directory for each function and put functions pass into it.
# FIXME:Non-function pass will be ignored.
import re
import sys
import os
from collections import defaultdict
from subprocess import call

if __name__ == "__main__":
    with open(sys.argv[1], "r") as file:
        funcCount = defaultdict(int)
        buffer = list()
        line = "123"
        while line != "":
            line = file.readline()
            buffer.append(line)
            #print(line, end="")
            res = re.match(r"\*\*\* IR Dump After ([^*]*) \*\*\*", line)
            if res:
                passname = res.groups()[0].replace(" ", "_")
                passname = passname.replace("/", "_")
                # Func attr
                line = file.readline()
                funcPass = re.match(r"; Function Attrs:", line:)
                buffer.append(line)

                # Get function name
                if funcPass:
                    line = file.readline()
                    buffer.append(line)
                    res = re.match(r"define [^@]*@([^(]*)\(", line)
                    assert res != None, "not funcPass"
                    funcName = res.groups()[0]
                else:
                    # FIXME: we should know how to terminiate parsing non-funcPass.
                    funcName = "UnknownPass"
                    buffer = []
                    continue
                funcCount[funcName] += 1


                # Open file for output
                call(["mkdir", "-p", funcName])
                outfile = open("{}/{}-{}".format(funcName, funcCount[funcName], passname), "w")
                for i in buffer:
                    outfile.write(i)
                buffer = []

                # Parse function body
                line = file.readline()
                while line != "}\n" and line != "":
                    #print("IR", line, end="")
                    outfile.write(line)
                    line = file.readline()

                ## end
                outfile.close()
                continue
            res = re.match(r"# \*\*\* IR Dump After ([^*]*) \*\*\*:", line)
            if res:
                passname = res.groups()[0].replace(" ", "_")
                passname = passname.replace("/", "_")
                # Get function name
                line = file.readline()
                res = re.match(r"# Machine code for function ([^:]*):", line)
                assert res, "function not found"
                funcName = res.groups()[0]
                funcCount[funcName] += 1

                # Open file for output
                outfile = open("{}/{}M-{}".format(funcName, funcCount[funcName], passname), "w")
                for i in buffer:
                    outfile.write(i)
                buffer = []

                # Parse function body
                line = "123"
                while line != "":
                    line = file.readline()
                    #print("MI", line, end="")
                    outfile.write(line)
                    res = re.match(r"# End machine code for function", line)
                    if res:
                        break
                outfile.close()
                continue


