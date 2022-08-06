import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/style/colors.dart';
import '../../../core/utils/show_toast_message.dart';
import '../../../core/utils/size_config.dart';
import '../../../core/utils/strings.dart';
import '../../../core/widget/box_decoration_widget.dart';
import '../../../core/widget/image_widget.dart';
import '../../../network/DataModels/data_model.dart';
import '../../../providers/list_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController? _controller;

  TextEditingController searchFieldController = TextEditingController();
  @override
  void initState() {
    @override
    final provider = Provider.of<ListProvider>(context, listen: false);
    provider.getChatUsersList();
    _controller = ScrollController();
    _controller!.addListener(_onScrollUpdated);
    super.initState();
  }

  Future<void> _onScrollUpdated() async {
    final maxScroll = _controller!.position.maxScrollExtent;
    final currentPosition = _controller!.position.pixels;
    if (currentPosition == maxScroll) {
      refreshList();
    }
  }

  refreshList() {
    final provider = Provider.of<ListProvider>(context, listen: false);
    provider.getChatUsersList();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var provider = Provider.of<ListProvider>(context);
    return Scaffold(
      body: Consumer<ListProvider>(builder: (context, data, child) {
        return Padding(
          padding: EdgeInsets.all(SizeConfig.bodyPadding),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [dataList(data, provider)]),
        );
      }),
    );
  }

  Widget buildProgressIndicator() {
    return Center(
        child:
            CircularProgressIndicator(color: Theme.of(context).primaryColor));
  }

  Widget titleWidget(String? title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: SizeConfig.screenHeight * 0.03),
      child: Text(
        title ?? "",
        style: Theme.of(context).textTheme.headline5,
      ),
    );
  }

  Widget dataList(ListProvider data, provider) =>
      data.isLoading || data.dataModel == null
          ? buildProgressIndicator()
          : Expanded(
              child: Column(
                children: [
                  titleWidget(data.dataModel!.title ?? ""),
                  searchFieldWidget(provider, data.dataModel),
                  data.dataModel!.rows!.isEmpty
                      ? Expanded(
                          child: Text("No data found",
                              style: Theme.of(context).textTheme.headline4!),
                        )
                      : searchFieldController.text.isNotEmpty &&
                              data.searchdataModel.isEmpty
                          ? Expanded(
                              child: Text("No data found",
                                  style:
                                      Theme.of(context).textTheme.headline4!),
                            )
                          : Expanded(
                              child: ListView.separated(
                                controller: _controller,
                                shrinkWrap: true,
                                padding: EdgeInsets.symmetric(
                                    vertical: 0,
                                    horizontal: SizeConfig.screenWidth * 0.02),
                                itemCount: data.searchdataModel.isNotEmpty
                                    ? data.searchdataModel.length
                                    : data.dataModel!.rows!.length,
                                itemBuilder: (context, index) {
                                  return details(data.searchdataModel.isNotEmpty
                                      ? data.searchdataModel[index]
                                      : data.dataModel!.rows![index]);
                                },
                                separatorBuilder: (context, index) {
                                  return Container();
                                },
                              ),
                            )
                ],
              ),
            );

  Widget details(DescriptionData descriptionData) =>
      descriptionData.title == null
          ? Container()
          : GradientScreen(
              childWidget: ListTile(
                title: Text(descriptionData.title ?? "",
                    style: Theme.of(context).textTheme.headline4),
                subtitle: Padding(
                  padding: EdgeInsets.only(top: SizeConfig.kPadding),
                  child: Text(descriptionData.description ?? "",
                      style: Theme.of(context).textTheme.bodyText1!),
                ),
                leading: ImageWidget(
                    borderRadius: 50,
                    imageUrl: descriptionData.imageHref ?? ""),
              ),
            );

  Widget searchFieldWidget(provider, dataModel) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.bodyPadding, vertical: SizeConfig.kPadding),
      child: TextFormField(
        onChanged: (value) {
          if (value.isEmpty) {
            FocusScope.of(context).unfocus();
            provider.searchByATitle(dataModel, "");
          }
        },
        controller: searchFieldController,
        style: Theme.of(context)
            .textTheme
            .headline4!
            .copyWith(color: Theme.of(context).primaryColor),
        decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            hintText: searchHere,
            suffixIcon: IconButton(
                onPressed: () {
                  if (searchFieldController.text.trim().isNotEmpty) {
                    FocusScope.of(context).unfocus();
                    provider.searchByATitle(
                        dataModel, searchFieldController.text);
                  } else {
                    FocusScope.of(context).unfocus();
                    showToastMessage(enterText);
                  }
                },
                icon: Icon(
                  Icons.search,
                  color: Theme.of(context).primaryColor,
                ))),
      ),
    );
  }
}
