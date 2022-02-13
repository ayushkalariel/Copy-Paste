part of home_page_view;

class HomePageBottom extends StatefulWidget {
  final List? foundEvents;
  const HomePageBottom({
    this.foundEvents,
    Key? key}) : super(key: key);

  @override
  State<HomePageBottom> createState() => _HomePageBottomState();
}

class _HomePageBottomState extends State<HomePageBottom> {
  final String _eventDay = "21";

  final String _eventMonth = "MAR";

  final String _eventDistance = "1.4 KM AWAY";

  final String _eventName = "Local Hero";

  final String _eventLocation = "South Statue Art Center";

  final String _buttonText = "View Event";

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      decoration: const BoxDecoration(
          color: ThemePurple.whiteColor,
          borderRadius: HomePageRadius.homeBottomContainer),
      child: Padding(
        padding: HomePadding.homeBottomContainerPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildNearestEvents(context),
            Column(
              children: [
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return _buildEventsImage(context,index);
                  },
                  itemCount: widget.foundEvents!.length,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEventsImage(BuildContext context,int index) {
    return Padding(
      padding: HomePadding.homeBottomListViewPadding,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 125,
            height: 125,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(_eventDay),
                Text(_eventMonth),
              ],
            ),
          ),
          Padding(
            padding: HomePadding.homeBottomEventInformationPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _eventDistance,
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                Padding(
                  padding: HomePadding.homeBottomEventNamePadding,
                  child: Text(
                    widget.foundEvents![index].name,
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(fontSize: HomePageSize.homeBottomEventName),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    HomePageIcon.homeBottomLocationIcon,
                    Text(_eventLocation)
                  ],
                ),
                SizedBox(
                  width: context.highWidthValue * 2,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(_buttonText),
                    style: ElevatedButton.styleFrom(
                      primary: ThemePurple.darkPurple,
                      textStyle: Theme.of(context).textTheme.button!.copyWith(
                            color: ThemePurple.whiteColor,
                          ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNearestEvents(BuildContext context) {
    return Text(
      HomePageString.yakinEtkinlikler,
      style: Theme.of(context).textTheme.bodyText1!.copyWith(
            fontSize: HomePageSize.homeBottomYakinEtkinlikSize,
          ),
    );
  }
}
