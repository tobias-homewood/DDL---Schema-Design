with open('input', 'r') as file:
    data = file.read().split(',\n')

    all_producers = set()
    artists = set()
    album = []
    for line in data:
        tuple1 = eval(line.strip())
        artist = eval(tuple1[3])
        artists = artists.union(artist)
        producers = eval(tuple1[-1])
        all_producers = all_producers.union(producers)
        # print(tuple1[-2])
        album.append(tuple1[-2])

    # for i in range(len(album)):
    #     print(f"('{album[i]}', {i+1}),")

    all_producers = list(all_producers)
    for i in range(len(all_producers)):
        for j in range(len(data)):
            line = data[j]
            tuple1 = eval(line.strip())
            producers_list = eval(tuple1[-1])
            if all_producers[i] in producers_list:
                print(f"({i+1}, {j+1}),")


    # for i in range(len(data)):
    #     line = data[i];
    #     tuple1 = eval(line.strip())
    #     index = album.index(tuple1[-2])
    #     print(f"('{tuple1[0]}', '{tuple1[1]}', {index+1}),")
        
    # for artist in artists:
        # print(f"('{artist}'),")
    # for producer in all_producers:
        # print(f"('{producer}'),")