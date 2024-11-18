const Announcements = () => {
  return (
    <div className="bg-white p-4 rounded-md">
      <div className="flex items-center justify-between">
        <h1 className="text-xl font-semibold">Announcements</h1>
        <span className="text-xs text-gray-400">View All</span>
      </div>
      <div className="flex flex-col gap-4 mt-4">
        <div className="bg-purple-200 rounded-md p-4">
          <div className="flex items-center justify-between ">
            <h2 className="font-medium">
              Lorem ipsum, dolor sit amet consectetur adipisicing.
            </h2>
            <span className="text-xs text-gray-400 bg-white rounded-md p-1">
              10-10-2025
            </span>
          </div>
          <p className="text-sm text-gray-600 mt-1">
            Lorem ipsum dolor sit amet consectetur adipisicing elit. Architecto
            unde a totam?
          </p>
        </div>
        <div className="bg-amber-200 rounded-md p-4">
          <div className="flex items-center justify-between">
            <h2 className="font-medium">
              Lorem ipsum, dolor sit amet consectetur adipisicing.
            </h2>
            <span className="text-xs text-gray-400 bg-white rounded-md p-1">
              10-10-2025
            </span>
          </div>
          <p className="text-sm text-gray-600 mt-1">
            Lorem ipsum dolor sit amet consectetur adipisicing elit. Architecto
            unde a totam?
          </p>
        </div>
        <div className="bg-sky-200 rounded-md p-4">
          <div className="flex items-center justify-between">
            <h2 className="font-medium">
              Lorem ipsum, dolor sit amet consectetur adipisicing.
            </h2>
            <span className="text-xs text-gray-400 bg-white rounded-md p-1">
              10-10-2025
            </span>
          </div>
          <p className="text-sm text-gray-600 mt-1">
            Lorem ipsum dolor sit amet consectetur adipisicing elit. Architecto
            unde a totam?
          </p>
        </div>
      </div>
    </div>
  );
};

export default Announcements;
